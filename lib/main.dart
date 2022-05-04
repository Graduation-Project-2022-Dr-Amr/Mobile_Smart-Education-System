import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/NavigationBar_Screens/start_screen.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Joining%20University/search_screen.dart';
import 'package:smart_education/Screens/Onboarding/onboarding.dart';
import 'package:smart_education/Screens/chat_rooms/chat/chat_screen.dart';
import 'package:smart_education/Screens/chat_rooms/chat_rooms_screen.dart';

import 'API/api/cacheHelper.dart';
import 'API/api/dio_helper.dart';
import 'API/api/endPoints.dart';
import 'Logics/StateManagement/Bloc/bloc.dart';
import 'Logics/StateManagement/Bloc/bloc_states.dart';
import 'Screens/chat_rooms/models/user_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark');
  bool? isRtl = CacheHelper.getData('isRtl');
  bool? showOnBoard = CacheHelper.getData('ShowOnBoard');
  Widget widget;
  TOKEN = CacheHelper.getData('token');

  if (showOnBoard == false) {
    if (TOKEN != null) {
      widget = StartScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnboardingScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    isRtl: isRtl,
    startWidget: ChatRoomsScreen(),
    // startWidget: ChatScreen(user: User(id: 1, name: 'Ahmed')),
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
