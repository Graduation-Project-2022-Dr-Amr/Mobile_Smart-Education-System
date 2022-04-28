import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/API/api/cacheHelper.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Authentication/Profile/profileScreen.dart';
import 'package:smart_education/Screens/NavigationBar_Screens/More%20Screens/recent_activity/recent_activity_screen.dart';
import 'package:smart_education/Screens/NavigationBar_Screens/More%20Screens/todo_part/view/all_tasks_screen.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'dart:math' as math;

import 'package:smart_education/shared/constants/size_config.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => Mybloc(),
      child: BlocConsumer<Mybloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CacheHelper.getData('isDark');
          var cubit = Mybloc.get(context);
          if (kDebugMode) {
            print('Mode dark ==>>> ${cubit.isDark}');
          }
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionateScreenHeight(40),
                horizontal: SizeConfig.getProportionateScreenWidth(32),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/mahmoud.png',
                          ),
                          maxRadius: 26,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenHeight(16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Devon Lane',
                              style: TextStyle(
                                color: HexColor('4F4F4F'),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigateTo(context, ProfileScreen());
                              },
                              child: Text(
                                'View profile',
                                style: TextStyle(
                                  color: HexColor('2F80ED'),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Mybloc.get(context).changeMode();
                              print(Mybloc.get(context).isDark);
                            },
                            icon: Icon(Icons.dark_mode)),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(58),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.account,
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),
                    // ExpansionWidget(
                    //                      titleBuilder: (double animationValue, _, bool isExpand,
                    //                          toogleFunction) {
                    //                        return InkWell(
                    //                          onTap: () => toogleFunction(animated: true),
                    //                          child: Container(
                    //                            width: 318,
                    //                            height: 55,
                    //                            decoration: BoxDecoration(
                    //                              borderRadius: BorderRadius.circular(15),
                    //                              color: Mybloc.get(context).isDark
                    //                                  ? HexColor('333739')
                    //                                  : HexColor('FFFFFF'),
                    //                              border: Border.all(color: cubit.borderColor),
                    //                            ),
                    //                            child: Row(
                    //                              children: [
                    //                                CircleAvatar(
                    //                                  child: Icon(
                    //                                    Icons.dark_mode_outlined,
                    //                                    color: Colors.grey[600],
                    //                                    size: 27,
                    //                                  ),
                    //                                  backgroundColor: Colors.grey[400],
                    //                                ),
                    //                                SizedBox(width: 10),
                    //                                Text(
                    //                                    cubit.isRtl
                    //                                        ? 'الثيمات ':'Theme',
                    //                                    style: Theme.of(context)
                    //                                        .textTheme
                    //                                        .headline3),
                    //                                Spacer(),
                    //                                Transform.rotate(
                    //                                  child: Icon(
                    //                                    Icons.arrow_forward_ios_sharp,
                    //                                    color: cubit.isDark
                    //                                        ? HexColor('FFFFFF')
                    //                                        : HexColor('333739'),
                    //                                  ),
                    //                                  angle: math.pi * animationValue / 0.666,
                    //                                ),
                    //                              ],
                    //                            ),
                    //                          ),
                    //                        );
                    //                      },
                    //                      content: Column(
                    //                        children: [
                    //                          SizedBox(
                    //                            height: 20,
                    //                          ),
                    //                          Container(
                    //                            width: 318,
                    //                            height: 55,
                    //                            decoration: BoxDecoration(
                    //                              borderRadius: BorderRadius.circular(15),
                    //                              color: cubit.isDark
                    //                                  ? HexColor('333739')
                    //                                  : HexColor('FFFFFF'),
                    //                              border: Border.all(color: cubit.borderColor),
                    //                            ),
                    //                            child: Row(
                    //                              mainAxisAlignment: MainAxisAlignment.start,
                    //                              children: [
                    //                                Radio(
                    //                                  toggleable: true,
                    //                                  value: 'On',
                    //                                  groupValue: cubit.darkModeRadio,
                    //                                  activeColor: Colors.red,
                    //                                  onChanged: (value) {
                    //                                    cubit.changeActiveRadio(value);
                    //                                    cubit.changeMode();
                    //                                    // cubit.changeMode();
                    //                                  },
                    //                                ),
                    //                                Text('On',
                    //                                  style: Theme.of(context).textTheme.headline3,
                    //                                ),
                    //                              ],
                    //                            ),
                    //                          ),
                    //                          SizedBox(
                    //                            height: 14,
                    //                          ),
                    //                          Container(
                    //                            width: 318,
                    //                            height: 55,
                    //                            decoration: BoxDecoration(
                    //                              borderRadius: BorderRadius.circular(15),
                    //                              color: cubit.isDark
                    //                                  ? HexColor('333739')
                    //                                  : HexColor('FFFFFF'),
                    //                              border: Border.all(color: cubit.borderColor),
                    //                            ),
                    //                            child: Row(
                    //                              mainAxisAlignment: MainAxisAlignment.start,
                    //                              children: [
                    //                                Radio(
                    //                                  toggleable: true,
                    //                                  value: 'Off',
                    //                                  groupValue: cubit.darkModeRadio,
                    //                                  activeColor: Colors.red,
                    //                                  onChanged: (value) {
                    //                                    cubit.changeActiveRadio(value);
                    //                                    cubit.changeMode();
                    //
                    //                                    // cubit.changeMode();
                    //                                  },
                    //                                ),
                    //                                Text(
                    //                                 'OFF',
                    //                                  style:
                    //                                  Theme.of(context).textTheme.headline3,
                    //                                ),
                    //                              ],
                    //                            ),
                    //                          ),
                    //                        ],
                    //                      ),
                    //                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.language,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          AppLocalizations.of(context)!.app_language,
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(34.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.manage,
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),

                    InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RecentActivityScreen())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            width: SizeConfig.getProportionateScreenWidth(10),
                          ),
                          Text(
                            AppLocalizations.of(context)!.activity,
                            style: TextStyle(
                              color: HexColor('4F4F4F'),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ToDoScreen())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            width: SizeConfig.getProportionateScreenWidth(10),
                          ),
                          Text(
                            AppLocalizations.of(context)!.my_to_do,
                            style: TextStyle(
                              color: HexColor('4F4F4F'),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(34.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.resource,
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.help_outline_sharp,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          AppLocalizations.of(context)!.help,
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outlined,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          AppLocalizations.of(context)!.about_us,
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            CacheHelper.removeData('token').then((value) {
                              navigateandFinish(context, LoginScreen());
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width:
                                    SizeConfig.getProportionateScreenWidth(10),
                              ),
                              Text(
                                AppLocalizations.of(context)!.sign_out_n,
                                style: TextStyle(
                                  color: HexColor('EB5757'),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
