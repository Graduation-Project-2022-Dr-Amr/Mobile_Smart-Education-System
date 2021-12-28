import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticalScreen extends StatefulWidget {
  const ArticalScreen({Key? key}) : super(key: key);

  @override
  _ArticalScreenState createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  (Icons.videocam_outlined),
                  size: 300,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '01. Introduction to Artificial Intelligent (AI)',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.bookmark_added_outlined,
                          size: 30,
                        ),
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Professor word',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.messenger_outline,
                          size: 30,
                        ),
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Discussion',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.task_outlined,
                          size: 30,
                        ),
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Quizzes',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.assignment_outlined,
                          size: 30,
                        ),
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Assignment',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.cloud_download_outlined,
                          size: 30,
                        ),
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Up next',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Icon(
                    (Icons.videocam_outlined),
                    size: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    ' What intelligent Agent and Environment ?',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
