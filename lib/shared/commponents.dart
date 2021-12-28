import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/Logics/StateManagement/Bloc/bloc.dart';
import 'package:login_signin/NavigationBar_Screens/start_screen.dart';
import 'package:login_signin/Screens/articale_screen.dart';
import 'package:login_signin/Screens/web_view.dart';
import 'package:login_signin/data/models/lessons.dart';
import 'package:login_signin/shared/constants/my_colors.dart';

// class CourseModel {
//   final String title1;
//   final String title2;
//   final String docName;
//   final String time;
//   final String assignment;
//
//
//   CourseModel({
//     required this.title1,
//     required this.title2,
//     required this.docName,
//     required this.time,
//     required this.assignment,
//   });
// }
// List<CourseModel> course = [
//   CourseModel(
//     title1: 'Digital',
//     title2: 'Communication',
//     docName: 'Amr Zamel',
//     time: '10h ',
//     assignment:'8 Assignments' ,
//   ),
//   CourseModel(
//     title1: 'Computer',
//     title2: 'Network',
//     docName: 'Amr Zamel',
//     time: '10h ',
//     assignment:'8 Assignments' ,
//   ),
//   CourseModel(
//     title1: 'Artificial',
//     title2: 'Intelligence',
//     docName: 'Amr Zamel',
//     time: '10h ',
//     assignment:'8 Assignments' ,
//   ),
//
// ];
List<Map> collegesNames = [
  {'name': 'Faculty of Engineering'},
  {'name': 'Faculty of computer science'},
  {'name': 'Faculty of accounting'},
  {'name': 'Faculty of Science'},
  {'name': 'Faculty of Arts'},
];
List<Map> articalNames = [
  {'name': 'Digital Communication '},
  {'name': 'Computer Network'},
  {'name': 'Artificial Intelligence'},
  {'name': 'Artificial Intelligence'},
];
List<Map> articalSvg = [
  {'name': 'assets/1.png'},
  {'name': 'assets/2.png'},
  {'name': 'assets/3.png'},
];
List<Map> articalDr = [
  {'name': 'Dr/Amr Zamel'},
  {'name': 'Dr/Amr Zamel'},
  {'name': 'Dr/Amr Zamel'},
  {'name': 'Dr/Amr Zamel'},
];

List<Map> articaltime = [
  {'name': '10 h'},
  {'name': '7 h'},
  {'name': '5 h'},
  {'name': '5 h'},
];

List<Map> articalvideos = [
  {'name': 'Introduction, Design system\n defination.'},
  {'name': 'Introduction, Design system\n defination.'},
  {'name': 'Introduction, Design system\n defination.'},
  {'name': 'Introduction, Design system\n defination.'},
];
List<Map> articalassignment = [
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
];

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
                  '${articalNames[index]['name']} ',
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

Widget builduniversityScreen(context) => ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: Colors.grey,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          navigateTo(context, StartScreen());
        },
        child: Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              Icon(
                Icons.house,
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                '${collegesNames[index]['name']}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      itemCount: collegesNames.length,
    );

Widget divider() => Divider(
      thickness: 0.3,
      color: MyColors.dark,
    );

Widget buildNewsWithConditionalBuilder(
        {required List articles, isSearch = false}) =>
    ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            buildArticleItem(articles[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: articles.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

Widget buildArticleItem(Lesson lesson, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(url: lesson.url));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Mybloc.get(context).isDark
                            ? Colors.white.withOpacity(0.7)
                            : MyColors.darkness,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          lesson.urlToImage!,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  lesson.publishedAt,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: MyColors.dark,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.bodyText1,
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: TextButton(
                        child: Text(
                          Mybloc.get(context).isRtl
                              ? 'إقرأ المزيد'
                              : 'Read More',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          navigateTo(context, WebViewScreen(url: lesson.url));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  String? Function(String?)? validate,
  VoidCallback? onPressed,
  Function(String?)? onChanged,
  required IconData prefixIcon,
  double borderRadius = 0,
  String? hint,
  IconData? suffixIcon,
  bool isPassword = false,
  required bool isRtl,
  Color color = Colors.black,
  Color textColor = Colors.white,
}) =>
    TextFormField(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      textAlign: isRtl ? TextAlign.right : TextAlign.left,
      controller: controller,
      style: TextStyle(
        color: textColor,
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.blue),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: color,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffixIcon,
                ),
              )
            : null,
      ),
      validator: validate,
      onChanged: onChanged,
      onTap: onPressed,
    );

//navigateTo(context,ScreenName()); <<==لما تعمل انتقال بين شاشتين تستخدما وتحط في الزر اللي يعمل انتقال
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateandFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false);

Widget appBarText(context) => Text(
      Mybloc.get(context).isRtl ? 'أخبارك - Akhbarak' : 'Akhbarak - أخبارك',
    );

Widget listInTabbarView1() {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[50],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[100],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[200],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[300],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[400],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[500],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[600],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[700],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.deepPurple[800],
        )
      ],
    ),
  );
}

Widget listInTabbarView2() {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[50],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[100],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[200],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[300],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[400],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[500],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[600],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[700],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.green[800],
        )
      ],
    ),
  );
}

Widget customRadioButton(String text, int index) {
  return MaterialButton(
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(),
    ),
  );
}
