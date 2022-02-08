import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/NavigationBar_Screens/homescreen.dart';
import 'package:smart_education/NavigationBar_Screens/start_screen.dart';
import 'package:smart_education/shared/commponents.dart';


class ArticalScreen extends StatefulWidget {
  const ArticalScreen({Key? key}) : super(key: key);

  @override
  _ArticalScreenState createState() => _ArticalScreenState();
}

class _ArticalScreenState extends State<ArticalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.0950323974082073,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 83, 203, 0.10000000149011612),
                        offset: Offset(0, -2),
                        blurRadius: 20)
                  ],
                  color: Color.fromRGBO(0, 83, 203, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, StartScreen());
                      },
                      icon: Icon(Icons.arrow_back),
                      color: HexColor('FFFFFF'),
                      iconSize: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.1996915887850467,
                    ),
                    Container(
                      //width:MediaQuery.of(context).size.width*0.8130841121495327,
                      //height: MediaQuery.of(context).size.height*0.031317494600432,
                      child: Text(
                        'Artificial Intelligence',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: HexColor('FFFFFF'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height *
                            0.2580993520518359,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                        child: Image.asset(
                          'assets/hateme.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 250,
                      top: 120,
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: HexColor('FFFFFF'),
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019438444924406,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Introduction: What is AI?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: HexColor('333333'),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.019438444924406,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.1168224299065421,
                                    height: MediaQuery.of(context).size.height *
                                        0.0539956803455724,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                        bottomLeft: Radius.circular(11),
                                        bottomRight: Radius.circular(11),
                                      ),
                                      color: Color.fromRGBO(25, 100, 209, 1),
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0086393088552916,
                                  ),
                                  Text(
                                    'Professeur\n     word',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('333333'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0747663551401869,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.1168224299065421,
                                    height: MediaQuery.of(context).size.height *
                                        0.0539956803455724,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                        bottomLeft: Radius.circular(11),
                                        bottomRight: Radius.circular(11),
                                      ),
                                      color: Color.fromRGBO(25, 100, 209, 1),
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0086393088552916,
                                  ),
                                  Text(
                                    'Discussion\n    ',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('333333'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0747663551401869,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.1168224299065421,
                                    height: MediaQuery.of(context).size.height *
                                        0.0539956803455724,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                        bottomLeft: Radius.circular(11),
                                        bottomRight: Radius.circular(11),
                                      ),
                                      color: Color.fromRGBO(25, 100, 209, 1),
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0086393088552916,
                                  ),
                                  Text(
                                    'Quizzes\n     ',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('333333'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0747663551401869,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.1168224299065421,
                                    height: MediaQuery.of(context).size.height *
                                        0.0539956803455724,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                        bottomLeft: Radius.circular(11),
                                        bottomRight: Radius.circular(11),
                                      ),
                                      color: Color.fromRGBO(25, 100, 209, 1),
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0086393088552916,
                                  ),
                                  Text(
                                    'Assignments\n     ',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('333333'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0747663551401869,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.1168224299065421,
                                    height: MediaQuery.of(context).size.height *
                                        0.0539956803455724,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                        bottomLeft: Radius.circular(11),
                                        bottomRight: Radius.circular(11),
                                      ),
                                      color: Color.fromRGBO(25, 100, 209, 1),
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0086393088552916,
                                  ),
                                  Text(
                                    'Download\n     ',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('333333'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.0259179265658747,
                    ),
                    Text(
                      'Up Next',
                      style: TextStyle(
                          color: HexColor('1964D1'),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.0259179265658747,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildItem(context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0086393088552916,
                        ),
                        itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildItem(context) => InkWell(
      onTap: () {
        navigateTo(context, ArticalScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 83, 203, 0.05000000074505806),
                offset: Offset(6, 6),
                blurRadius: 8)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: <Widget>[
              Container(
                  width: 97,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    image: DecorationImage(
                        image: AssetImage('assets/articel2.png'),
                        fit: BoxFit.fitWidth),
                  )),
              SizedBox(
                  width:
                      MediaQuery.of(context).size.width * 0.0186915887850467),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Introduction: What is AI?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: HexColor('333333'),
                        fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0086393088552916),
                    Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.watch,
                              size: 15,
                            ),
                            Text(
                              '51m',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: HexColor('333333'),
                                fontFamily: 'SF Pro Display',
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.0373831775700935),
                        Row(
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              size: 15,
                            ),
                            Text(
                              '4',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.0373831775700935),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border_outlined,
                              size: 15,
                            ),
                            Text(
                              '2',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
