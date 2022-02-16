import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smart_education/Screens/articale_screen.dart';
import 'package:smart_education/Screens/course_screen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/my_colors.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  PanelController pc = PanelController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // BorderRadiusGeometry radius = BorderRadius.only(
    //   topLeft: Radius.circular(24.0),
    //   topRight: Radius.circular(24.0),
    // );
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: MyColors.homeBackGround,
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/Logo.svg',
          width: SizeConfig.getProportionateScreenWidth(113),
          height: SizeConfig.getProportionateScreenHeightLarge(26.2),
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        //leadingWidth: 0,
        titleSpacing: SizeConfig.getProportionateScreenWidth(17),
        //leading: Container(),
        toolbarHeight: SizeConfig.getProportionateScreenHeightLarge(88),
        actions: [
          Container(
            width: 24,
            height: 24,
            child: Positioned(
              top: 2,
              left: 3,
              child: SvgPicture.asset(
                'assets/notification on.svg',
                semanticsLabel: 'vector',
              ),
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
                          Radius.elliptical(
                            32,
                            32,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          height: 1,
                        ),
                      )),
                ])),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(16)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeightLarge(24),
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                              width: MediaQuery.of(context).size.width * 0.014018691588785,
                            ),
                            SvgPicture.asset('assets/VectorSeeAll.svg', semanticsLabel: 'vector'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeightLarge(16),
                ),
                Container(
                  height: SizeConfig.getProportionateScreenHeightLarge(317),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => testCourseItem(
                      context,
                      index,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: SizeConfig.getProportionateScreenWidth(10),
                    ),
                    itemCount: coursesData.length,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeightLarge(32),
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
                  height: SizeConfig.getProportionateScreenHeightLarge(8),
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
                  height: SizeConfig.getProportionateScreenHeightLarge(24),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildarticalitem(context, index),
                        separatorBuilder: (context, index) => Container(
                          height: SizeConfig.getProportionateScreenHeightLarge(16),
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
    );
  }

  Widget testCourseItem(context, index) => GestureDetector(
        onTap: () {
          navigateTo(context, CourseScreen());
        },
        child: Container(
          width: SizeConfig.getProportionateScreenWidth(178),
          height: SizeConfig.getProportionateScreenHeightLarge(317),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 48,
                left: 0,
                child: Container(
                  width: SizeConfig.getProportionateScreenWidth(178),
                  height: SizeConfig.getProportionateScreenHeightLarge(269),
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
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 0,
                end: 0,
                top: SizeConfig.getProportionateScreenHeightLarge(230),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coursesData[index]['courseName'].toString().split(' ')[0] +
                          '\n' +
                          coursesData[index]['courseName'].toString().split(' ')[1],
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
                    SizedBox(height: SizeConfig.getProportionateScreenHeightLarge(8)),
                    Text(
                      '${coursesData[index]['doctorName']}',
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
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 16,
                child: Container(
                  width: SizeConfig.getProportionateScreenWidth(146),
                  height: SizeConfig.getProportionateScreenHeightLarge(214),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color.fromRGBO(166, 166, 166, 1),
                    image: DecorationImage(
                      image: AssetImage('${coursesData[index]['imageURL']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildarticalitem(context, index) => Container(
        height: SizeConfig.getProportionateScreenHeightLarge(88),
        width: SizeConfig.getProportionateScreenWidth(396),
        decoration: BoxDecoration(
          color: HexColor('FFFFFF'),
          borderRadius: BorderRadius.circular(13),
        ),
        padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(9),
          right: SizeConfig.getProportionateScreenWidth(81),
          top: SizeConfig.getProportionateScreenWidth(8),
          bottom: SizeConfig.getProportionateScreenWidth(8),
        ),
        child: GestureDetector(
          onTap: () {
            navigateTo(context, ArticalScreen());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/articel1.png'),
                height: SizeConfig.getProportionateScreenHeightLarge(72),
                width: SizeConfig.getProportionateScreenWidth(97),
              ),
              SizedBox(
                width: SizeConfig.getProportionateScreenWidth(8),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenWidth(10.4),
                    bottom: SizeConfig.getProportionateScreenWidth(8)),
                child: Column(
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
                      height: SizeConfig.getProportionateScreenHeightLarge(4),
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
              ),
            ],
          ),
        ),
      );

  Widget buildBottomSheet(context) => Container(
        width: double.infinity,
        height: 101,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.522144317626953),
            topRight: Radius.circular(24.522144317626953),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: Color.fromRGBO(0, 83, 203, 1),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: HexColor('0053CB'), borderRadius: BorderRadius.vertical(top: Radius.circular(24.5221))),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.0259179265658747),
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
