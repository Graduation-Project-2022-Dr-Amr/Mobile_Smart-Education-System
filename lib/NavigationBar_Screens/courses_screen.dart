import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Screens/course_details_screen.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import '../API/Models/course.dart';
import '../Logics/StateManagement/Bloc/course_bloc.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}
//CourseBloc.get(context).getAllCourses();
class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => CourseBloc()..getAllCourses(),
      child: BlocConsumer<CourseBloc,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var courseBloc = CourseBloc.get(context);
          return Scaffold(
            body: courseBloc.allCourses.isEmpty ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loading .."),
                  SizedBox(width: 10),
                  SizedBox(width:25,height: 25,child: CircularProgressIndicator(strokeWidth:3))
                ],
              ),
            ):Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(24),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9252336448598131,
                    height: MediaQuery.of(context).size.height * 0.060475161987041,
                    child: TextFormField(
                      onTap: () {
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter some words!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                      maxLines: 1,
                      cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                      textAlign: TextAlign.start,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          child: Icon(
                            Icons.search,
                            color: HexColor('C4E2FC'),
                          ),
                          height: MediaQuery.of(context).size.height * .0259179266,
                          width: MediaQuery.of(context).size.width * .0259179266,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: HexColor('C4E2FC'),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor('E3F2FD'),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusColor: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(32),
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
                    height: SizeConfig.getProportionateScreenHeight(16),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (SizeConfig.getProportionateScreenWidth(178) /
                          SizeConfig.getProportionateScreenHeight(317)),
                      crossAxisSpacing: SizeConfig.getProportionateScreenWidth(16),
                      mainAxisSpacing: SizeConfig.getProportionateScreenHeight(16),
                      physics: BouncingScrollPhysics(),
                      children: List.generate(courseBloc.allCourses.length,
                              (index) => testCourseItem(context:context, index:index,allCourses:courseBloc.allCourses)),
                    ),
                  )
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}

Widget testCourseItem({context, index,required List<Course> allCourses}) => GestureDetector(
  onTap: () {
    navigateTo(context, CourseScreen(courseData:allCourses[index]));
  },
  child: Container(
    //margin: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(15)),
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: HexColor("0053CB").withOpacity(0.1),
                  offset: Offset(6, 6),
                  blurRadius: 8,
                ),
              ],
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: HexColor("E8E8E8"),
                width: 1,
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: SizeConfig.getProportionateScreenHeight(230),
          child: Container(
            padding: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(12)),
            width: SizeConfig.getProportionateScreenWidth(146),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(8)),
                  child: Text(
                    allCourses[index].title.toString(),
                    /*.split(' ')[0] +
                        '\n' +
                        coursesData[index]['courseName'].toString().split(' ')[1]*/
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: HexColor('0053CB'),
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      //letterSpacing: 0.10000000149011612,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(8)),
                Text(
                  allCourses[index].teacher != null || true?coursesData[index]['doctorName']:"",
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
        ),
        Positioned(
          top: 0,
          left: SizeConfig.getProportionateScreenWidth(16),
          child: Container(
            width: SizeConfig.getProportionateScreenWidth(146),
            height: SizeConfig.getProportionateScreenHeight(214),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Color.fromRGBO(166, 166, 166, 1),
              image: DecorationImage(
                image: NetworkImage("https://mohamedameer.pythonanywhere.com/api/${allCourses[index].thumbnail}"),//AssetImage('${coursesData[index]['imageURL']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
