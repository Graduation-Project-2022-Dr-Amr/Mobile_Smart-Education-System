import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/constants/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/Logo.svg',
          width: SizeConfig.getProportionateScreenWidth(113),
          height: SizeConfig.getProportionateScreenHeightLarge(26.2),
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        //leadingWidth: 0,
        titleSpacing: SizeConfig.getProportionateScreenWidth(17),
        //leading: Container(),
        toolbarHeight: SizeConfig.getProportionateScreenHeightLarge(88),
        actions: [
          Container(
            width: 24,
            height: 24,
            child: Positioned(
              top: 2,
              left: 3,
              child: SvgPicture.asset(
                'assets/notification on.svg',
                semanticsLabel: 'vector',
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
                width: 32,
                height: 32,
                child: Stack(children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 83, 203, 1),
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(
                            32,
                            32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 11,
                      left: 11,
                      child: Text(
                        'N',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          letterSpacing: 0.10000000149011612,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      )),
                ])),
          ),
        ],
      ),
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
                    maxRadius: 40,
                  ),
                  SizedBox(
                    width: SizeConfig.getProportionateScreenHeightLarge(16),
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
                    onPressed: () {},
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
