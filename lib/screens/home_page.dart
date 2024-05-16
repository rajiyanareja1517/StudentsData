import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:students_data/utils/globles.drt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.of(context).pushNamed("add_std");
          },
          child: Icon(Icons.add),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
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
                          size: 50,
                        ),
                        Text("No data!",style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
                : Container(
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
                                            Globle.stdList[index].student_name,
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
                                            Globle.stdList[index].student_grid,
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
                                      child: Icon(
                                        Icons.edit_calendar_rounded,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Globle.stdList.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.delete,
                                        ),
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
