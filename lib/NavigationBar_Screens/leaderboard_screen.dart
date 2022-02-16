import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int _activeIndex = 0;

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
            children: [_buildTabs(), _buildContent()],
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
          itemCount: 3,
          itemBuilder: (context, index) {
            final isRtl = isRTL(context);
            final _rightPadding = isRtl && index == 0 ? 12.0 : 4.0;
            final _leftPadding = !isRtl && index == 0 ? 12.0 : 4.0;
            return GestureDetector(
              onTap: (() => setState(() => _activeIndex = index)),
              child: Container(
                margin: EdgeInsets.only(left: _leftPadding, right: _rightPadding, top: 8, bottom: 8),
                child: Chip(
                    label: Text(_getName(index), style: TextStyle(color: Colors.white)),
                    backgroundColor: _activeIndex == index ? Colors.blueAccent : Colors.grey.shade400),
              ),
            );
          }),
    );
  }

  String _getName(int index) {
    switch (index) {
      case 0:
        return 'All';
      case 1:
        return 'Artificial Inteligence';
      case 2:
        return 'Communications';

      default:
        return 'All';
    }
  }

  Widget _buildContent() {
    final widgets = [
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
    ];

    return widgets[_activeIndex];
  }
}

bool isRTL(BuildContext context) {
  return Directionality.of(context) == TextDirection.rtl;
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
