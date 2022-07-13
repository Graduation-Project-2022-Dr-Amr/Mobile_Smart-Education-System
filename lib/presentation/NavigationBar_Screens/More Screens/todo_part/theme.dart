import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:get/get.dart';

const Color darkPurple = Color(0xff363da4);
const Color purple = Color(0xff0053CB);
const Color yellow = Color(0xFFffb746);
const Color pink = Color(0xFFff4667);
const Color white = Colors.white;
const Color likeWhite = Color(0xFFf3f3f3);
const Color nearlyBlack = Color(0xFF222222);
const Color grey = Color(0xFF424242);
const Color green = Color(0xff23d60b);


class Themes{
  static bool isDarkMode(BuildContext ctx) => Theme.of(ctx).brightness == Brightness.dark ;
  static final light = ThemeData(
    fontFamily: 'Cairo',
    backgroundColor: likeWhite,
      primaryColor: purple,
     // primarySwatch: Colors.purple,
      brightness: Brightness.light
  );

  static final dark = ThemeData(
      fontFamily: 'Cairo',
    backgroundColor: nearlyBlack,
      primaryColor: nearlyBlack,
      //primarySwatch: Colors.green,
      brightness: Brightness.dark
  );
}