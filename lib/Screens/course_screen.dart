import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/NavigationBar_Screens/start_screen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

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
    SizeConfig().init(context);
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
                  height: SizeConfig.getProportionateScreenHeight(453),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 83, 203, 0.05000000074505806),
                        offset: Offset(6, 6),
                        blurRadius: 8,
                      )
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
                        height: SizeConfig.getProportionateScreenHeight(15),
                      ),
                      Container(
                        width: SizeConfig.getProportionateScreenWidth(130),
                        height: SizeConfig.getProportionateScreenHeight(190),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: Color.fromRGBO(166, 166, 166, 1),
                          image: DecorationImage(
                            image: AssetImage('assets/course1.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(24),
                      ),
                      Text(
                        'Artificial Intelligence',
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: HexColor('FFFFFF'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(8),
                      ),
                      Text(
                        'Amr Zamel',
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: HexColor('FFFFFF'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(24),
                      ),
                      Container(
                        width: SizeConfig.getProportionateScreenWidth(396),
                        height: SizeConfig.getProportionateScreenHeight(74),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
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
                                    SizedBox(
                                      width: SizeConfig
                                          .getProportionateScreenWidth(9),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Length',
                                          textScaleFactor: 1.0,
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
                                        SizedBox(
                                            height: SizeConfig
                                                .getProportionateScreenHeight(
                                                4)),
                                        Text(
                                          '40h, 15m',
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: HexColor('FFFFFF'),
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.10000000149011612,
                                            fontWeight: FontWeight.w600,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: SizeConfig.getProportionateScreenWidth(
                                      51),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.quiz_outlined,
                                      color: HexColor('FFFFFF'),
                                    ),
                                    SizedBox(
                                      width: SizeConfig
                                          .getProportionateScreenWidth(9),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                            letterSpacing: 0.10000000149011612,
                                            fontWeight: FontWeight.w300,
                                            height: 1,
                                          ),
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
                                            letterSpacing: 0.10000000149011612,
                                            fontWeight: FontWeight.w600,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: SizeConfig.getProportionateScreenWidth(
                                      51),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch,
                                      color: HexColor('FFFFFF'),
                                    ),
                                    SizedBox(
                                      width: SizeConfig
                                          .getProportionateScreenWidth(9),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                  height: SizeConfig.getProportionateScreenHeight(151),
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
                    color: Colors.red,
                    //color: Color.fromRGBO(255, 255, 255, 1),
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
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: HexColor('0053CB'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(16),
                      ),
                      Text(
                        'Lörem ipsum askbränd tran fast plasiv SMM spening marknadsplatser robot\n retail dihet hören som content provider DALL·E, om podda om multi helix.\n Pongen heterosase logolog kaliga ansvarsfull app vånigt och orade\n spevengen epide. ',
                        textScaleFactor: 1.0,
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
                  height: SizeConfig.getProportionateScreenWidth(16),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Content',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 18,
                      color: HexColor('0053CB'),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(25)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Stepper(
                        currentStep: currentStep,
                        onStepTapped: (int index) {
                          setState(() {
                            currentStep = index;
                          });
                        },
                        controlsBuilder: (context, _) {
                          return Container();
                        },
                        steps: [
                          Step(
                              title: Text('Introduction'),
                              content: Column(
                                children: <Widget>[
                                  buildItem(context),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildItem(context),
                                ],
                              ),
                              isActive: currentStep == 0,
                              state: StepState.complete),
                          Step(
                              title: Text('Second unit '),
                              content: Column(
                                children: <Widget>[
                                  buildItem(context),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildItem(context),
                                ],
                              ),
                              isActive: currentStep == 1,
                              state: StepState.complete),
                          Step(
                              title: Text('Third unit'),
                              content: Column(
                                children: <Widget>[
                                  buildItem(context),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildItem(context),
                                ],
                              ),
                              isActive: currentStep == 2,
                              state: StepState.complete),
                          Step(
                              title: Text('Final unit'),
                              content: Column(
                                children: <Widget>[
                                  buildItem(context),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildItem(context),
                                ],
                              ),
                              isActive: currentStep == 2,
                              state: StepState.complete),
                        ],
                      ),
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
    // navigateTo(context, StartScreen());
  },
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 83, 203, 0.05000000074505806),
          offset: Offset(6, 6),
          blurRadius: 8,
        )
      ],
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    child: Padding(
      padding: EdgeInsets.only(left: 8),
      child: Row(
        children: <Widget>[
          Container(
            width: SizeConfig.getProportionateScreenWidth(79),
            height: SizeConfig.getProportionateScreenHeight(72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Color.fromRGBO(0, 0, 0, 0.5),
              image: DecorationImage(
                image: AssetImage('assets/hateme.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.getProportionateScreenWidth(8),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Introduction: What is AI ?',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: HexColor('333333'),
                    // fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(8),
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.watch,
                          size: 15,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(6.5),
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
                      width: SizeConfig.getProportionateScreenWidth(17),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.quiz_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(6.5),
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
                      width: SizeConfig.getProportionateScreenWidth(17),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark_border_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(6.5),
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
