import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/API/api/cacheHelper.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/shared/commponents.dart';

import '../shared/constants/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionateScreenHeight(40),
          horizontal: SizeConfig.getProportionateScreenWidth(32),
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/mahmoud.png',
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
                      Text(
                        'View profile',
                        style: TextStyle(
                          color: HexColor('2F80ED'),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(58),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Account',
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
                    Icons.settings,
                  ),
                  SizedBox(
                    width: SizeConfig.getProportionateScreenWidth(10),
                  ),
                  Text(
                    'Settings',
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
                    'Language',
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
                    'Manage',
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
                    Icons.watch_later_outlined,
                  ),
                  SizedBox(
                    width: SizeConfig.getProportionateScreenWidth(10),
                  ),
                  Text(
                    'Activity',
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
                    'Resource',
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
                    'Help',
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
                    'About us',
                    style: TextStyle(
                      color: HexColor('4F4F4F'),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(87),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      CacheHelper.removeData('token').then((value){
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
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          'Sign out',
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
  }
}
