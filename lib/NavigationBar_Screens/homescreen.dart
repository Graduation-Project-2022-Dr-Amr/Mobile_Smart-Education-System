import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Container(
              color: HexColor('F8F8F8'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0259179265658747,
                  ),
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
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0086393088552916,
                  ),
                  Text(
                    'Below are a list of courses provide from your university, you can\n drag to view all courses or click through to view the content',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      color: HexColor('828282'),
                      //height: 21.48,
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * 0.0172786177105832,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.2311015118790497,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildcourseitem(
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
                          itemCount: 4,
                        ),
                      ),
                    ],
                  ),
                  // SlidingUpPanel(
                  //   controller: pc,
                  //   panel: Center(
                  //     child: MaterialButton(
                  //       child: Text('Show new panel'),
                  //       onPressed: () {
                  //         pc.close();
                  //         visible = false;
                  //         setState(() {});
                  //         pc.open();
                  //       },
                  //     ),
                  //   ),
                  //   collapsed: Container(
                  //     height: 500,
                  //     decoration: BoxDecoration(
                  //         color: Colors.lightGreen,
                  //         borderRadius: radius
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "This is the collapsed Widget",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  //   body: Center(
                  //     child: Text("This is the Widget behind the sliding panel"),
                  //   ),
                  //   borderRadius: radius,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}
