import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Layout/app_layout.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';
import '../../../API/Models/chapter.dart';
import '../../../API/Models/course.dart';
import '../../../API/Models/video.dart';
import '../../../Logics/StateManagement/Bloc/course_bloc.dart';

class CourseScreen extends StatelessWidget {
  int currentStep = 0;
  bool complete = false;
  final Course courseData;

  CourseScreen({Key? key, required this.courseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => CourseBloc()..getAllVideos(courseId: courseData.id),
        child: BlocConsumer<CourseBloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var courseBloc = CourseBloc.get(context);

            List<Chapter> chapters = courseBloc.courseChapters;
            List<Video> videos = courseBloc.courseVideos;

            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: SizeConfig.getProportionateScreenHeight(497)),
                        Container(
                          padding: EdgeInsets.only(
                            left: SizeConfig.getProportionateScreenWidth(24),
                            right: SizeConfig.getProportionateScreenWidth(24),
                            //top: SizeConfig.getProportionateScreenHeight(24),
                            bottom: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          width: SizeConfig.screenWidth,
                          // height: SizeConfig.getProportionateScreenHeight(171),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(32),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor("0053CB").withOpacity(0.05), offset: Offset(6, 6), blurRadius: 8)
                            ],
                            color: Colors.white,
                            // border: Border.all(
                            //   color: Color.fromRGBO(232, 232, 232, 1),
                            //   width: 1,
                            // ),
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
                                courseData.description.toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  overflow: TextOverflow.fade,
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
                          height: SizeConfig.getProportionateScreenHeight(16),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(24)),
                          child: Text(
                            'Content',
                            textScaleFactor: 1.0, // textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: HexColor('0053CB'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        //SizedBox(height: SizeConfig.getProportionateScreenHeight(25)),
                        if (chapters.isNotEmpty)
                          Stepper(
                            physics: NeverScrollableScrollPhysics(),
                            margin: EdgeInsets.only(
                              left: SizeConfig.getProportionateScreenWidth(40),
                              right: SizeConfig.getProportionateScreenWidth(10),
                            ),
                            currentStep: currentStep,
                            onStepTapped: (int index) {
                              CourseBloc.get(context).changeIndex(index);
                            },
                            controlsBuilder: (context, _) {
                              return Container();
                            },
                            steps: List.generate(chapters.length, (index) {
                              List<Video> cv = courseBloc.getChapterVideos(videos: videos, chapter: chapters[index]);
                              return Step(
                                  title: Text(
                                    chapters[index].chapterName,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  content: Container(
                                    color: Colors.white,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(24))
                                            .copyWith(
                                                bottom: SizeConfig.getProportionateScreenHeight(10),
                                                top: SizeConfig.getProportionateScreenHeight(5)),
                                    child: Column(
                                      children: List.generate(cv.length, (i) {
                                        return buildItem(context: context, chapter: chapters[index], video: cv[i]);
                                      }),
                                    ),
                                  ),
                                  isActive: currentStep == index,
                                  state: StepState.complete);
                            }),
                          ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.getProportionateScreenHeight(470),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 83, 203, 0.05000000074505806),
                                offset: Offset(6, 6),
                                blurRadius: 8)
                          ],
                          color: Color.fromRGBO(0, 83, 203, 1),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.getProportionateScreenHeight(32),
                            ),
                            Row(
                              children: [
                                SizedBox(width: SizeConfig.getProportionateScreenWidth(21)),
                                IconButton(
                                  onPressed: () {
                                    navigateTo(context, AppLayout());
                                  },
                                  icon: Icon(Icons.arrow_back),
                                  color: HexColor('FFFFFF'),
                                  iconSize: 24,
                                )
                              ],
                            ),
                            ClipRRect(
                              child: Image.asset(
                                'assets/images/course1.png',
                                width: SizeConfig.getProportionateScreenWidth(130),
                                height: SizeConfig.getProportionateScreenHeight(190),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.getProportionateScreenHeight(24),
                            ),
                            Text(
                              courseData.title.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: HexColor('FFFFFF')),
                            ),
                            SizedBox(
                              height: SizeConfig.getProportionateScreenHeight(8),
                            ),
                            Text(
                              courseData.user != null || true ? coursesData[0]['doctorName'] : "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: HexColor('FFFFFF')),
                            ),
                            SizedBox(
                              height: SizeConfig.getProportionateScreenHeight(24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

Widget buildItem({context, chapter, required Video video}) => InkWell(
      onTap: () {
        // navigateTo(context, StartScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: HexColor("0053CB").withOpacity(0.05), offset: Offset(6, 6), blurRadius: 8)],
          color: Colors.white,
        ),
        padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(8)),
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
                  image: DecorationImage(image: AssetImage('assets/images/hateme.png'), fit: BoxFit.fitWidth),
                )),
            SizedBox(width: MediaQuery.of(context).size.width * 0.0186915887850467),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    video.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HexColor('333333'),
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0086393088552916),
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
                      SizedBox(width: MediaQuery.of(context).size.width * 0.0373831775700935),
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
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.0373831775700935),
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
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
    );
