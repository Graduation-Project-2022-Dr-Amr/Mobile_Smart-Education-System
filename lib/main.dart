import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/Layout/app_layout.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Onboarding/onboarding.dart';
import 'package:smart_education/shared/Modes/themes.dart';

import 'API/api/cacheHelper.dart';
import 'API/api/dio_helper.dart';
import 'API/api/endPoints.dart';
import 'Logics/StateManagement/Bloc/bloc.dart';
import 'Logics/StateManagement/Bloc/bloc_states.dart';
import 'firebase_options.dart';
import 'Screens/NavigationBar_Screens/More Screens/todo_part/db/db_helper.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await DioHelper.init();
  await DbHelper.initDb().then((value) => print("db initialization"));
  await CacheHelper.init();

  Widget widget;
  TOKEN = CacheHelper.getData('token');
  bool? showOnBoard = CacheHelper.getData('ShowOnBoard');

  bool? isDark = CacheHelper.getData('isDark');
  bool? isRtl = CacheHelper.getData('isRtl');

  if (kDebugMode) {
    print('Onboarding Status ============>>> $showOnBoard');
    print('This is TOKEN TOKEN ==========>>> $TOKEN');
    print('Mode dark ====================>>> $isDark');
    print('App English ==================>>> $isRtl');
    print('=============================================================');
  }
  if (TOKEN != null) {
    widget = AppLayout();
  } else if (TOKEN == null && showOnBoard == null) {
    widget = OnboardingScreen();
  } else {
    widget = TOKEN != null ? AppLayout() : LoginScreen();
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
        BlocProvider(create: (context) => Mybloc()..changeMode(fromCache: isDark)),
      ],
      child: BlocConsumer<Mybloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = Mybloc.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget,
              locale: cubit.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: Mybloc.get(context).appMode,
              // routes: {},
            );
          }),
    );
  }
}
