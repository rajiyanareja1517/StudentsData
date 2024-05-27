import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_data/model/sudent_data.dart';
import 'package:students_data/screens/add_std_data.dart';
import 'package:students_data/utils/globles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController userInputGRID = TextEditingController();
TextEditingController userInputNM = TextEditingController();
TextEditingController userInputSTD = TextEditingController();
ImagePicker imagePicker = ImagePicker();
String? pickImagePath;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.orange.shade700,
          focusColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddStdData()),
            ).then((value) => setState(() {}));
          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: Stack(
          children: [
            Container(
              width: 500,
              height: double.infinity,
              child: Image.asset(
                "lib/assets/home_bg.png",
                fit: BoxFit.fill,
              ),
            ),
            Globle.stdList.length == 0
                ? Container(
                    margin: EdgeInsets.only(top: 400),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Icon(
                          Icons.no_sim,
                          color: Colors.grey,
                          size: 100,
                        ),
                        Text(
                          "No data!",
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        )
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: Globle.stdList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 105,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 4, top: 4, bottom: 4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(
                                          backgroundImage: FileImage(File(Globle
                                              .stdList[index].student_image)),
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 12, top: 10),
                                            child: Text(
                                              Globle
                                                  .stdList[index].student_name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: Text(
                                              Globle.stdList[index]
                                                  .student_standard,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: Text(
                                              Globle
                                                  .stdList[index].student_grid,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(
                                          onPressed: () {
                                            userInputGRID.text = Globle
                                                .stdList[index].student_grid
                                                .toString();
                                            userInputNM.text = Globle
                                                .stdList[index].student_name
                                                .toString();
                                            userInputSTD.text = Globle
                                                .stdList[index].student_standard
                                                .toString();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('UPDATE'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                    "Pick Image",
                                                                  ),
                                                                  content: Text(
                                                                    "Choose Image From Gallery or Camera",
                                                                  ),
                                                                  actions: [
                                                                    FloatingActionButton(
                                                                      mini:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        xFile =
                                                                            await imagePicker.pickImage(
                                                                          source:
                                                                              ImageSource.camera,
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          if (xFile !=
                                                                              null) {
                                                                            pickImagePath =
                                                                                xFile!.path;
                                                                          }
                                                                        });

                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      elevation:
                                                                          3,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .camera_alt,
                                                                      ),
                                                                    ),
                                                                    FloatingActionButton(
                                                                      mini:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        xFile =
                                                                            await imagePicker.pickImage(
                                                                          source:
                                                                              ImageSource.gallery,
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          if (xFile !=
                                                                              null) {
                                                                            pickImagePath =
                                                                                xFile!.path;
                                                                          }
                                                                        });

                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      elevation:
                                                                          3,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .image,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                        },
                                                        child: Text(
                                                          "Select Image from \nGallery and Camera",
                                                        ),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            userInputGRID,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "GRNO",
                                                                labelText:
                                                                    "GRNO"),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            userInputGRID.text =
                                                                value
                                                                    .toString();
                                                          });
                                                        },
                                                      ),
                                                      TextField(
                                                        controller: userInputNM,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Name",
                                                          labelText: "Name",
                                                        ),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            userInputNM.text =
                                                                value
                                                                    .toString();
                                                          });
                                                        },
                                                      ),
                                                      TextField(
                                                        controller:
                                                            userInputSTD,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText: "STD",
                                                                labelText:
                                                                    "STD"),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            userInputSTD.text =
                                                                value
                                                                    .toString();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child:
                                                          const Text('Update'),
                                                      onPressed: () {
                                                        setState(() {
                                                          Globle.stdList[
                                                                  index] =
                                                              StudentData(
                                                                  student_grid:
                                                                      userInputGRID
                                                                          .text,
                                                                  student_name:
                                                                      userInputNM
                                                                          .text,
                                                                  student_standard:
                                                                      userInputSTD
                                                                          .text,
                                                                  student_image:
                                                                      pickImagePath!);
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                        // Handle the submit action
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon:
                                              Icon(Icons.edit_calendar_rounded),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Delete entry'),
                                                  content: const Text(
                                                      'Are you sure you want to delete?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child:
                                                          const Text('Confirm'),
                                                      onPressed: () {
                                                        setState(() {
                                                          Globle.stdList
                                                              .removeAt(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );

                          // Text(Globle.stdList[index].student_grid,style: TextStyle(fontSize: 50),);
                        },
                      ),
                    ),
                  ),
            Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Students",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                )),
          ],
        ));
  }
}
