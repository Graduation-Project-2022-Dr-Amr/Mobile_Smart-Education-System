import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Joining%20University/search_screen.dart';
import 'package:smart_education/Screens/Onboarding/onboarding.dart';

import 'API/api/cacheHelper.dart';
import 'API/api/dio_helper.dart';
import 'API/api/endPoints.dart';
import 'Logics/StateManagement/Bloc/bloc.dart';
import 'Logics/StateManagement/Bloc/bloc_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark');
  bool? isRtl = CacheHelper.getData('isRtl');
  bool? showOnBoard = CacheHelper.getData('ShowOnBoard');
  Widget widget;
  TOKEN = CacheHelper.getData('token');

  if (showOnBoard == false) {
    if (TOKEN != null) {
      widget = SearchScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnboardingScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    isRtl: isRtl,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final bool? isRtl;
  late final Widget startWidget;

  MyApp({this.isDark, required this.startWidget, this.isRtl});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Mybloc()),
      ],
      child: BlocConsumer<Mybloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget,
            );
          }),
    );
  }
}
