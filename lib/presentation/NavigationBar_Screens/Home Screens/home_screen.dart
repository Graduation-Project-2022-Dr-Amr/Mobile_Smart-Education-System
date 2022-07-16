import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smart_education/API/Models/course.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/course_bloc.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import '../Courses Screens/course_details_screen.dart';
import '../Courses Screens/courses_screen.dart';
import 'Articales Details/articale_screen.dart';

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
    return BlocProvider<CourseBloc>(
      create: (ctx) => CourseBloc()..getAllCourses(),
      child: Scaffold(
        key: scaffoldkey,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.getProportionateScreenWidth(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.courses,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: HexColor('0053CB'),
                        //height: 21.48,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(16)),
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(context, CoursesScreen(showAppBar: true));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.see_aLL,
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
                              width: SizeConfig.getProportionateScreenWidth(4),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: HexColor('0053CB'),
                              size: SizeConfig.getProportionateScreenWidth(14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(16),
                ),
                BlocBuilder<CourseBloc, AppStates>(
                  builder: (context, state) {
                    var courseBloc = CourseBloc.get(context);
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(courseBloc.allCourses.length, (index) {
                          return CourseItem(
                            context,
                            courseBloc.allCourses[index],
                          );
                        }),
                      ),
                    );
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.recommended,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: HexColor('0053CB'),
                    //height: 21.48,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(8),
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(16)),
                  child: Text(
                    AppLocalizations.of(context)!
                        .based_on_your_recent_performance_in_quizzes_assignments_we_highly_recommend_reviewing_the_materials_below,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: HexColor('828282'),
                      //height: 21.48,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(24),
                ),
                SingleChildScrollView(
                  child: Column(children: List.generate(3, (index) => buildarticalitem(context, index))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CourseItem(context, Course course) => GestureDetector(
        onTap: () {
          navigateTo(context, CourseScreen(courseData: course));
        },
        child: Container(
          margin: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(15)),
          width: SizeConfig.getProportionateScreenWidth(178),
          height: SizeConfig.getProportionateScreenHeight(348),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: SizeConfig.getProportionateScreenHeight(48),
                left: 0,
                child: Container(
                  width: SizeConfig.getProportionateScreenWidth(178),
                  height: SizeConfig.getProportionateScreenHeight(269),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("0053CB").withOpacity(0.1),
                        offset: Offset(6, 6),
                        blurRadius: 8,
                      ),
                    ],
                    color: Mybloc.get(context).isDark ? HexColor('333739') : HexColor('FFFFFF'),
                    border: Border.all(
                      color: HexColor("E8E8E8"),
                      width: 1,
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 0,
                end: 0,
                top: SizeConfig.getProportionateScreenHeight(230),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${course.title}',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
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
                    SizedBox(height: SizeConfig.getProportionateScreenHeight(8)),
                    Text(
                      '${course.description}',
                      textScaleFactor: 1.0,
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
                  height: SizeConfig.getProportionateScreenHeight(214),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(166, 166, 166, 1),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${course.picture}',
                        ),
                        fit: BoxFit.cover,
                        onError: (_, __) => Image.asset('assets/images/course1.png')),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildarticalitem(context, index) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.getProportionateScreenHeight(16)),
      height: SizeConfig.getProportionateScreenHeight(100),
      width: SizeConfig.getProportionateScreenWidth(396),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [BoxShadow(color: HexColor('0053CB').withOpacity(0.1), offset: Offset(6, 6), blurRadius: 8)]),
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(8)),
      child: GestureDetector(
        onTap: () {
          navigateTo(context, ArticalScreen());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/articel1.png'),
              height: SizeConfig.getProportionateScreenHeight(72),
              width: SizeConfig.getProportionateScreenWidth(97),
            ),
            SizedBox(
              width: SizeConfig.getProportionateScreenWidth(8),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.getProportionateScreenWidth(11), bottom: SizeConfig.getProportionateScreenWidth(0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${articalvideos[index]['name']}',
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: HexColor('333333'),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(4),
                  ),
                  Text(
                    '${artical2Names[index]['name']}',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: HexColor('828282'),
                    ),
                  ),
                  Text(
                    '${articalDr[index]['name']}',
                    textScaleFactor: 1.0,
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
  }

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