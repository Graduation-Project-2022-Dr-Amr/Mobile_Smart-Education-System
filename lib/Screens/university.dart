

import 'package:flutter/material.dart';
import 'package:login_signin/shared/commponents.dart';


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
           onPressed: (){
             Navigator.pop(context);
           },
           icon:Icon(Icons.arrow_back_ios_new,color: Colors.red,)),
        title: Text('Zagazig University',style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor:Colors.white,
      ),
      body:Column(
        children: [
          builduniversityScreen(context),
        ],
      ),
    );
  }
}
