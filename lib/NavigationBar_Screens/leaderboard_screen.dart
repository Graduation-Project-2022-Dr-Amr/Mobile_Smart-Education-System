import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

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
      body: DefaultTabController(
        length: 3,
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
                      text: 'All',
                    ),
                    Tab(
                      text: 'Artificial Intelligence',
                    ),
                    Tab(
                      text: 'Digital Communication',
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
                      itemCount: itemData.length,
                    ),
                  ),
                  Center(
                    child: Text("Artificial Intelligence Pages"),
                  ),
                  Center(
                    child: Text("Digital Communication Pages"),
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
        height: SizeConfig.getProportionateScreenHeightLarge(54),
        decoration: BoxDecoration(
          color: HexColor('FFFFFF'),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        padding: EdgeInsets.all(7.5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: HexColor('C4C4C4'),
            ),
            SizedBox(
              width: SizeConfig.getProportionateScreenWidth(16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 itemData[index]['name'],
                  style: TextStyle(
                    color: HexColor('#4F4F4F'),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeightLarge(4),
                ),
                Text(
                  itemData[index]['degree'],
                  style: TextStyle(
                    color: HexColor('#4F4F4F'),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              itemData[index]['number'],
              style: TextStyle(
                color: HexColor('#4F4F4F'),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 16,
              ),
            ),
          ],
        ));

List<dynamic> itemData = [
  {'name': 'Devon Lane', 'degree': '12,454', 'number': '1'},
  {'name': 'Theresa Webb', 'degree': '12,454', 'number': '2'},
  {'name': 'Courtney Henry', 'degree': '12,454', 'number': '3'},
  {'name': 'Arlene McCoy', 'degree': '12,454', 'number': '4'},
  {'name': 'Leslie Alexander', 'degree': '12,454', 'number': '5'},
  {'name': 'Marvin McKinney', 'degree': '12,454', 'number': '6'},
  {'name': 'Courtney Henry', 'degree': '12,454', 'number': '7'},
  {'name': 'Wade Warren', 'degree': '12,454', 'number': '8'},
];
