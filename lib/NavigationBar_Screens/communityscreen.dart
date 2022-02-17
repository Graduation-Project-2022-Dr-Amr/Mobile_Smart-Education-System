import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: HexColor('FFFFFF'),
        title: SvgPicture.asset(
          'assets/Logo.svg',
          width: SizeConfig.getProportionateScreenWidth(113),
          height: SizeConfig.getProportionateScreenHeightLarge(26.2),
          fit: BoxFit.contain,
        ),
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
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTabs(),
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
                          height:
                              SizeConfig.getProportionateScreenHeightLarge(8),
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
  }

  Widget _buildTabs() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            final isRtl = isRTL(context);
            final _rightPadding = isRtl && index == 0 ? 12.0 : 4.0;
            final _leftPadding = !isRtl && index == 0 ? 12.0 : 4.0;
            return GestureDetector(
              onTap: (() => setState(() => _activeIndex = index)),
              child: Container(
                margin: EdgeInsets.only(
                    left: _leftPadding,
                    right: _rightPadding,
                    top: 8,
                    bottom: 8),
                child: Chip(
                    label: Text(_getName(index),
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: _activeIndex == index
                        ? Colors.blueAccent
                        : Colors.grey.shade400),
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
      height: SizeConfig.getProportionateScreenHeightLarge(101),
      decoration: BoxDecoration(
        color: HexColor('2F80ED'),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Text(
        'Lörem ipsum testbädd faning internet of\n things\n\nToday at 1:01 PM',
        style: TextStyle(
            color: HexColor('FFFFFF'),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal),
      ),
    );
