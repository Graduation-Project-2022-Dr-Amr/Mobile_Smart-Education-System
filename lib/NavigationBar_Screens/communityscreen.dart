import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

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
              Container(
                height: SizeConfig.getProportionateScreenHeightLarge(36),
                width: SizeConfig.getProportionateScreenWidth(78),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: HexColor('2F80ED'),
                      borderRadius: BorderRadius.circular(28.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Bot',
                    ),
                    Tab(
                      text: 'Chats',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildItem(
                        context,
                        index,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: SizeConfig.getProportionateScreenHeightLarge(8),
                      ),
                      itemCount: 5,
                    ),
                  ),
                  Center(
                    child: Text("Chat Pages"),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
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
