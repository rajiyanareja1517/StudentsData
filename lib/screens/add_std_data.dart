import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_data/model/sudent_data.dart';
import 'package:students_data/utils/globles.drt.dart';

class AddStdData extends StatefulWidget {
  const AddStdData({super.key});

  @override
  State<AddStdData> createState() => _AddStdDataState();
}

TextEditingController userInputGRID = TextEditingController();
TextEditingController userInputNM = TextEditingController();
TextEditingController userInputSTD = TextEditingController();
ImagePicker imagePicker = ImagePicker();
XFile? xFile;
String? pickImagePath;

class _AddStdDataState extends State<AddStdData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "lib/assets/add_bg.png",
              fit: BoxFit.fill,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 250, left: 20, right: 20),
            child: ListView(
              children: [
                Text(
                  "Add Student data..",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: userInputGRID,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        userInputGRID.text = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Colors.grey,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,

                      hintText: "GRId",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),

                      //create lable
                      labelText: 'GRID',
                      //lable style
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: userInputNM,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        userInputNM.text = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: Colors.grey,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,

                      hintText: "Name",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),

                      //create lable
                      labelText: 'Name',
                      //lable style
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: userInputSTD,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        userInputSTD.text = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: Icon(
                        Icons.cast_for_education,
                        color: Colors.grey,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,

                      hintText: "STD",

                      //make hint text
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),

                      //create lable
                      labelText: 'STD',
                      //lable style
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    child: Container(
                        width: double.infinity,
                        height: 77,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 20),
                        child: Text(
                          "Select Image from \nGallery and Camera",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey)
                            // button text
                            )),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Pick Image",
                              ),
                              content: Text(
                                "Choose Image From Gallery or Camera",
                              ),
                              actions: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () async {
                                    xFile = await imagePicker.pickImage(
                                      source: ImageSource.camera,
                                    );
                                    setState(() {
                                      if (xFile != null) {
                                        pickImagePath = xFile!.path;
                                      }
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  elevation: 3,
                                  child: Icon(
                                    Icons.camera_alt,
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: () async {
                                    xFile = await imagePicker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    setState(() {
                                      if (xFile != null) {
                                        pickImagePath = xFile!.path;
                                      }
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  elevation: 3,
                                  child: Icon(
                                    Icons.image,
                                  ),
                                ),
                              ],
                            );
                          });
                    }),
                GestureDetector(
                    child: Container(
                        width: 100,
                        height: 52,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 40, bottom: 20),
                        child: Text(
                          "Add Data",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("lib/assets/button_bg.png"),
                              fit: BoxFit.cover),
                          // button text
                        )),
                    onTap: () {
                      setState(() {
                        Globle.stdList.add(StudentData(
                            student_grid: userInputGRID.text,
                            student_name: userInputNM.text,
                            student_standard: userInputSTD.text,
                            student_image: pickImagePath!));
                      });

                      userInputGRID.clear();
                      userInputNM.clear();
                      userInputSTD.clear();
                      pickImagePath="";
                      print(Globle.stdList.length);
                      final snackBar = SnackBar(
                        content: const Text('Add Record successfully!'),
                        backgroundColor: (Colors.green),
                        action: SnackBarAction(
                          label: 'dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }),

              ],
            ),
          ),
          Container(
            margin:EdgeInsets.only(top: 25,left: 10) ,
              alignment: Alignment.topLeft,
              child: IconButton( onPressed: () {
                Navigator.of(context).pop();
              }, icon:Icon(Icons.arrow_back_outlined,color: Colors.white,size: 32),)),
        ],
      ),
    );
  }
}
