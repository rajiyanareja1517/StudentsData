import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(
          "Students",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pushNamed("add_std");
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: Globle.stdList.length,
        itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(),
        );
      },),
    );
  }
}
