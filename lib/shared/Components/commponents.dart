import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Layout/app_layout.dart';
import 'package:smart_education/shared/constants/my_colors.dart';

import 'package:fluttertoast/fluttertoast.dart';

List<Map> coursesData = [
  {
    'courseName': 'Artificial Intelligence',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course1.png',
  },
  {
    'courseName': 'Digital Communication',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course1.png',
  },
  {
    'courseName': 'Digital Communication',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course2.png',
  },
  {
    'courseName': 'Digital Communication',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course3.png',
  },
  {
    'courseName': 'Digital Communication',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course1.png',
  },
  {
    'courseName': 'Digital Communication',
    'doctorName': 'Dr/Amr Zamel',
    'imageURL': 'assets/images/course2.png',
  },
];
List<Map> collegesNames = [
  {'name': 'Faculty of Engineering'},
  {'name': 'Faculty of computer science'},
  {'name': 'Faculty of accounting'},
  {'name': 'Faculty of Science'},
  {'name': 'Faculty of Arts'},
];
List<Map> articalNames = [
  {'name': 'Digital\n Communication '},
  {'name': 'Digital\n Communication '},
  {'name': 'Digital\n Communication '},
  {'name': 'Artificial Intelligence'},
  {'name': 'Artificial Intelligence'},
];
List<Map> artical2Names = [
  {'name': 'Digital Communication '},
  {'name': 'Digital Communication '},
  {'name': 'Digital Communication '},
  {'name': 'Artificial Intelligence'},
  {'name': 'Artificial Intelligence'},
];
List<Map> articalSvg = [
  {'name': 'assets/images/course1.png'},
  {'name': 'assets/images/course2.png'},
  {'name': 'assets/images/course3.png'},
];
List<Map> articalDr = [
  {'name': 'Dr/Amr Zamel'},
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
  {'name': 'Introduction, Design system\n defination.'},
];
List<Map> articalassignment = [
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
  {'name': ' | 8 Assignments'},
];


Widget divider() => Divider(
      thickness: 0.3,
      color: MyColors.dark,
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




Widget customRadioButton(String text, int index) {
  return MaterialButton(
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(),
    ),
  );

}


 showSnackBarComponent({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text,style: TextStyle(fontSize: 20),)));
}


void showMyToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: choseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  SUCESS,
  ERROR,
  WARNING,
  SAD,
  EXCITED,
  ANGRY,
  DONE,
  NOTBAD,
  EMOJI
}

Color choseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCESS:
      color = HexColor('47b372');
      break;
    case ToastStates.DONE:
      color = HexColor('094cb9');
      break;
    case ToastStates.EXCITED:
      color = HexColor('2d9484');
      break;
    case ToastStates.ANGRY:
      color = HexColor('d56506');
      break;
    case ToastStates.NOTBAD:
      color = HexColor('03989e');
      break;
    case ToastStates.EMOJI:
      color = HexColor('a14242');
      break;
    case ToastStates.ERROR:
      color = HexColor('e13433');
      break;
    case ToastStates.WARNING:
      color = HexColor('4974a5');
      break;
    case ToastStates.SAD:
      color = HexColor('6e7f80');
      break;
  }
  return color;
}