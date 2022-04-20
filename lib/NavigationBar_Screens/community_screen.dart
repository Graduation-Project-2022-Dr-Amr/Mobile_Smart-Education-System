import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import 'leaderboard_screen.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(create: (context)=>Mybloc(),
    child: BlocConsumer<Mybloc,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(17)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  Text(
                    "Community",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  _buildTabs(),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  _activeIndex == 0
                      ? Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildItem(
                        context,
                        index,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(8),
                      ),
                      itemCount: 5,
                    ),
                  )
                      : Center(
                    child: Text("Chat Pages"),
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

  Widget _buildTabs() {
    return Container(
      height: SizeConfig.getProportionateScreenHeight(50),
      //margin: EdgeInsets.all(SizeConfig.getProportionateScreenHeight(10)),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            // final isRtl = isRTL(context);
            // final _rightPadding = isRtl && index == 0 ? 12.0 : 4.0;
            // final _leftPadding = !isRtl && index == 0 ? 12.0 : 4.0;
            return GestureDetector(
              onTap: (() => setState(() => _activeIndex = index)),
              child: Container(
                margin: EdgeInsets.only(
                    right: SizeConfig.getProportionateScreenWidth(8)),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(24),
                    vertical: SizeConfig.getProportionateScreenHeight(8)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.getProportionateScreenWidth(28)),
                  color: _activeIndex == index
                      ? HexColor("2F80ED")
                      : HexColor("F2F2F2"),
                ),
                child: Text(
                  _getName(index),
                  style: TextStyle(
                      color: _activeIndex == index
                          ? Colors.white
                          : HexColor("828282"),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          }),
    );
  }

  String _getName(int index) {
    switch (index) {
      case 0:
        return 'Chat';
      case 1:
        return 'Bots';

      default:
        return 'Chat';
    }
  }
}

Widget buildItem(
  context,
  index,
) =>
    Container(
      width: SizeConfig.getProportionateScreenWidth(396),
      height: SizeConfig.getProportionateScreenHeight(101),
      decoration: BoxDecoration(
        color: HexColor('2F80ED'),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lörem ipsum testbädd faning internet of things.',
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor('FFFFFF'),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
          Spacer(),
          Text(
            "Today at 1:01 PM",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor('FFFFFF'),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          )
        ],
      ),
    );
