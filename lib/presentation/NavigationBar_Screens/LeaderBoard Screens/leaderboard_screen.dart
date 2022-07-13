import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
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
    print(Mybloc.get(context).isDark);

    return BlocProvider(create: (context)=>Mybloc(),
    child: BlocConsumer<Mybloc,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(16)),
                    child: Text(
                      "leaderboard",
                    style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
                    child: _buildTabs(),
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(16)),
                      child: _buildContent(),
                    ),
                  )
                ],
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
          itemCount: 3,
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
        return 'All';
      case 1:
        return 'Artificial Inteligence';
      case 2:
        return 'Digital Communications';

      default:
        return 'All';
    }
  }

  Widget _buildContent() {
    final widgets = [
      Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          //shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => buildItem(
            context,
            index,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: SizeConfig.getProportionateScreenHeight(16),
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
        width: SizeConfig.getProportionateScreenWidth(400),
        height: SizeConfig.getProportionateScreenHeight(54),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: SizeConfig.getProportionateScreenWidth(26),
              backgroundColor: HexColor('C4C4C4'),
            ),
            SizedBox(width:SizeConfig.getProportionateScreenWidth(16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemData[index]['name'],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Mybloc.get(context).isDark ? HexColor('#FFFFFF'): HexColor('#4F4F4F'),
                  ),
                ),
                Text(
                  itemData[index]['degree'],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Mybloc.get(context).isDark ? HexColor('#FFFFFF'): HexColor('#4F4F4F'),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              itemData[index]['number'],
              style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Mybloc.get(context).isDark ? HexColor('#FFFFFF'): HexColor('#4F4F4F'),
              ),
            ),
          ],
        ),
    );

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
