import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/NavigationBar_Screens/start_screen.dart';
import 'package:smart_education/Screens/articale_screen.dart';
import 'package:smart_education/shared/commponents.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).size.height * 0.4892008639308855,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 83, 203, 0.05000000074505806),
                          offset: Offset(6, 6),
                          blurRadius: 8)
                    ],
                    color: Color.fromRGBO(0, 83, 203, 1),
                  ),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height*0.0356371490280778,
                      // ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              navigateTo(context, StartScreen());
                            },
                            icon: Icon(Icons.arrow_back),
                            color: HexColor('FFFFFF'),
                            iconSize: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.031317494600432,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.3037383177570093,
                        height: MediaQuery.of(context).size.height *
                            0.2051835853131749,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Color.fromRGBO(166, 166, 166, 1),
                          image: DecorationImage(
                            image: AssetImage('assets/course1.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0259179265658747,
                      ),
                      Text(
                        'Artificial Intelligence',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: HexColor('FFFFFF')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0086393088552916,
                      ),
                      Text(
                        'Amr Zamel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: HexColor('FFFFFF')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0259179265658747,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.9252336448598131,
                        height: MediaQuery.of(context).size.height *
                            0.0799136069114471,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Color.fromRGBO(25, 100, 209, 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch,
                                      color: HexColor('FFFFFF'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Length',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w300,
                                              height: 1),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '40h, 15m',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.1191588785046729,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.quiz_outlined,
                                      color: HexColor('FFFFFF'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Quizzes',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w300,
                                              height: 1),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '10',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.1191588785046729,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch,
                                      color: HexColor('FFFFFF'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Assignments',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w300,
                                              height: 1),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '8',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: HexColor('FFFFFF'),
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing:
                                                  0.10000000149011612,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).size.height * 0.10846652267818575,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(34),
                      bottomRight: Radius.circular(39),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 83, 203, 0.05000000074505806),
                          offset: Offset(6, 6),
                          blurRadius: 8)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A breif',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: HexColor('0053CB'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0172786177105832,
                      ),
                      Text(
                        'Lörem ipsum askbränd tran fast plasiv SMM spening marknadsplatser robot\n retail dihet hören som content provider DALL·E, om podda om multi helix.\n Pongen heterosase logolog kaliga ansvarsfull app vånigt och orade\n spevengen epide. ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: HexColor('25282B'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.0172786177105832,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Content',
                    style: TextStyle(
                      fontSize: 18,
                      color: HexColor('0053CB'),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.0169978401727862,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      // Stepper(
                      //   controlsBuilder: (context,
                      //       {onStepContinue, onStepCancel}) {
                      //     return Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: ElevatedButton(
                      //               style: ButtonStyle(
                      //                 backgroundColor:
                      //                     MaterialStateProperty.all<Color>(
                      //                         HexColor('0053CB')),
                      //               ),
                      //               onPressed: onStepContinue,
                      //               child: Text(
                      //                 'Next',
                      //                 style: TextStyle(
                      //                   color: HexColor('FFFFFF'),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           if (currentStep > 0)
                      //             Expanded(
                      //               child: ElevatedButton(
                      //                 style: ButtonStyle(
                      //                   backgroundColor:
                      //                       MaterialStateProperty.all<Color>(
                      //                           HexColor('0053CB')),
                      //                 ),
                      //                 onPressed: onStepCancel,
                      //                 child: Text(
                      //                   'Back',
                      //                   style: TextStyle(
                      //                     color: HexColor('FFFFFF'),
                      //                   ),
                      //                 ),
                      //               ),
                      //             )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   currentStep: currentStep,
                      //   onStepTapped: (int index) {
                      //     setState(() {
                      //       currentStep = index;
                      //     });
                      //   },
                      //   onStepContinue: () {
                      //     if (currentStep <= 0) {
                      //       setState(() {
                      //         currentStep += 1;
                      //       });
                      //     }
                      //   },
                      //   onStepCancel: () {
                      //     if (currentStep > 0) {
                      //       setState(() {
                      //         currentStep -= 1;
                      //       });
                      //     }
                      //   },
                      //   steps: <Step>[
                      //     Step(
                      //       title: const Text('Introduction'),
                      //       isActive: currentStep >= 0,
                      //       state: currentStep == 0
                      //           ? StepState.editing
                      //           : StepState.complete,
                      //       content: Container(
                      //         alignment: Alignment.centerLeft,
                      //         child: ListView.separated(
                      //           shrinkWrap: true,
                      //           itemBuilder: (context, index) =>
                      //               buildItem(context),
                      //           separatorBuilder: (context, index) => SizedBox(
                      //             height: MediaQuery.of(context).size.height *
                      //                 0.0086393088552916,
                      //           ),
                      //           itemCount: 2,
                      //         ),
                      //       ),
                      //     ),
                      //     Step(
                      //       title: Text('Second unit '),
                      //       isActive: currentStep >= 1,
                      //       state: currentStep == 1
                      //           ? StepState.editing
                      //           : currentStep < 1
                      //               ? StepState.disabled
                      //               : StepState.complete,
                      //       content: Container(
                      //         alignment: Alignment.centerLeft,
                      //         child: ListView.separated(
                      //           shrinkWrap: true,
                      //           itemBuilder: (context, index) =>
                      //               buildItem(context),
                      //           separatorBuilder: (context, index) => SizedBox(
                      //             height: MediaQuery.of(context).size.height *
                      //                 0.0086393088552916,
                      //           ),
                      //           itemCount: 2,
                      //         ),
                      //       ),
                      //     ),
                      //     Step(
                      //       title: Text('Third unit '),
                      //       isActive: currentStep >= 2,
                      //       state: currentStep == 2
                      //           ? StepState.editing
                      //           : currentStep < 2
                      //               ? StepState.disabled
                      //               : StepState.complete,
                      //       content: Container(
                      //         alignment: Alignment.centerLeft,
                      //         child: ListView.separated(
                      //           shrinkWrap: true,
                      //           itemBuilder: (context, index) =>
                      //               buildItem(context),
                      //           separatorBuilder: (context, index) => SizedBox(
                      //             height: MediaQuery.of(context).size.height *
                      //                 0.0086393088552916,
                      //           ),
                      //           itemCount: 2,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.0259179265658747,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                        image: AssetImage('assets/hateme.png'),
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
