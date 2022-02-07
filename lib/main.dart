import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signin/Screens/Onboarding/onboarding.dart';
import 'package:login_signin/Screens/Questions/add_equation_screen.dart';
import 'package:login_signin/data/api/dio_helper.dart';
import 'package:login_signin/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';

import 'Logics/StateManagement/Bloc/bloc.dart';
import 'Logics/StateManagement/Bloc/bloc_states.dart';
import 'shared/Modes/dark_mode.dart';
import 'shared/Modes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getBool(key: 'isDark');
  bool? isRtl = CashHelper.getBoolRtl(key: 'isRtl');

  runApp(MyApp(isDark, isRtl));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final bool? isRtl;

  MyApp(this.isDark, this.isRtl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Mybloc()
        ..changeAppMode(fromShared: isDark)
        ..changeAppDirection(fromShared: isRtl),
      child: BlocConsumer<Mybloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightmode,
          darkTheme: darkmode,
          themeMode:
              Mybloc.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
          home: Directionality(
              textDirection: Mybloc.get(context).isRtl
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: AddQuestionScreen()),
        ),
      ),
    );
  }
}
