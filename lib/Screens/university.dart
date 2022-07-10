import 'package:flutter/material.dart';
import 'package:smartEdu/shared/commponents.dart';

import '../NavigationBar_Screens/start_screen.dart';

class University extends StatefulWidget {
  University({Key? key}) : super(key: key);

  @override
  State<University> createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.red,
            )),
        title: Text(
          'Zagazig University',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          builduniversityScreen(context),
        ],
      ),
    );
  }

  Widget builduniversityScreen(context) => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            navigateTo(context, StartScreen());
          },
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                Icon(
                  Icons.house,
                  color: Colors.blue,
                  size: 50,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '${collegesNames[index]['name']}',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        itemCount: collegesNames.length,
      );
}
