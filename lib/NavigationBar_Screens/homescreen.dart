import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/Screens/articale_screen.dart';
import 'package:login_signin/Screens/course_screen.dart';
import 'package:login_signin/shared/commponents.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  PanelController pc = new PanelController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      key: scaffoldkey,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Container(
              color: HexColor('F8F8F8'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/Logo.svg',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        child: Positioned(
                          top: 2,
                          left: 3,
                          child: SvgPicture.asset('assets/notification on.svg',
                              semanticsLabel: 'vector'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                            width: 32,
                            height: 32,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 83, 203, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(32, 32)),
                                      ))),
                              Positioned(
                                  top: 11,
                                  left: 11,
                                  child: Text(
                                    'N',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 14,
                                        letterSpacing: 0.10000000149011612,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ])),
                      ),
                      // IconButton(
                      //   onPressed: (){},
                      //   icon: Icon(Icons.account_circle_outlined),),
                    ],
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0259179265658747,
                  ),
                  Row(
                    children: [
                      Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: HexColor('0053CB'),
                          //height: 21.48,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'SEE ALL',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor('1964D1'),
                                  fontFamily: 'SF Pro Display',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.014018691588785,
                              ),
                              SvgPicture.asset('assets/VectorSeeAll.svg',
                                  semanticsLabel: 'vector'),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0205183585313175,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.2311015118790497,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => testCourseItem(
                              context,
                              index,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0186915887850467,
                            ),
                            itemCount: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0345572354211663,
                  ),
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: HexColor('0053CB'),
                      //height: 21.48,
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0086393088552916,
                  ),
                  Text(
                    'based on your recent performance in quizzes, assignments — We\n highly recommend reviewing the materials below.',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: HexColor('828282'),
                      //height: 21.48,
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0259179265658747,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              buildarticalitem(context, index),
                          separatorBuilder: (context, index) => Container(
                            height: 8,
                          ),
                          itemCount: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: buildBottomSheet(context),
    );
  }

  Widget testCourseItem(context, index) => InkWell(
    onTap: (){
      navigateTo(context, CourseScreen());

    },
    child: Container(
          width: 178,
          height: 317,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 48,
                left: 0,
                child: Container(
                  width: 178,
                  height: 269,
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
                        blurRadius: 8,
                      ),
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 1),
                      width: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 16,
                child: Text(
                  '${articalNames[index]['name']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor('0053CB'),
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.10000000149011612,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                  top: 276,
                  left: 16,
                  child: Text(
                    '${articalDr[index]['name']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('575757'),
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.10000000149011612,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  )),
              Positioned(
                top: 0,
                left: 16,
                child: Container(
                  width: 146,
                  height: 214,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color.fromRGBO(166, 166, 166, 1),
                    image: DecorationImage(
                      image: AssetImage('${articalSvg[index]['name']}'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
  );

  Widget buildcourseitem(context, index) => InkWell(
        onTap: () {
          navigateTo(context, CourseScreen());
        },
        child: Row(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
                width: MediaQuery.of(context).size.width * 0.3551401869158879,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Image(
                          image: AssetImage('${articalSvg[index]['name']}'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0086393088552916,
                        ),
                        Text(
                          '${articalNames[index]['name']}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: HexColor('0053CB'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0086393088552916,
                        ),
                        Text(
                          '${articalDr[index]['name']}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: HexColor('333333'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${articaltime[index]['name']}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: HexColor('333333'),
                              ),
                            ),
                            Text(
                              '${articalassignment[index]['name']}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: HexColor('333333'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildarticalitem(context, index) => Container(
        height: MediaQuery.of(context).size.height * 0.0950323974082073,
        width: MediaQuery.of(context).size.width * 0.9252336448598131,
        decoration: BoxDecoration(
          color: HexColor('FFFFFF'),
          borderRadius: BorderRadius.circular(13),
        ),
        padding: EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            navigateTo(context, ArticalScreen());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/articel1.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${articalvideos[index]['name']}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: HexColor('333333'),
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0043196544276458,
                  ),
                  Text(
                    '${artical2Names[index]['name']} ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: HexColor('828282'),
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0043196544276458,
                  ),
                  Text(
                    ':${articalDr[index]['name']}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: HexColor('828282'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget buildBottomSheet(context) => Container(
    width: double.infinity,
    height: 101,
    decoration: BoxDecoration(
      borderRadius : BorderRadius.only(
        topLeft: Radius.circular(24.522144317626953),
        topRight: Radius.circular(24.522144317626953),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      color : Color.fromRGBO(0, 83, 203, 1),
    ),
    child: Container(
      decoration: BoxDecoration(
          color: HexColor('0053CB'),
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(24.5221))),
      height: MediaQuery.of(context).size.height * 0.1090712742980562,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.1869158878504673,
            height: 2,
            color: HexColor('C4E2FC'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0086393088552916,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.0934579439252337,
            height: 2,
            color: HexColor('C4E2FC'),
          ),
          SizedBox(
              height:
              MediaQuery.of(context).size.height * 0.0259179265658747),
          Text(
            'CONTINUE STUDYING',
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: HexColor('FFFFFF'),
              //height: 21.48,
            ),
          ),
        ],
      ),
    ),
  );
}
