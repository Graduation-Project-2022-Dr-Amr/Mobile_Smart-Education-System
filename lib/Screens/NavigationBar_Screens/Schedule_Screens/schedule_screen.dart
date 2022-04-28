import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Logics/StateManagement/Bloc/bloc.dart';
import '../../../Logics/StateManagement/Bloc/bloc_states.dart';
import '../../../shared/constants/size_config.dart';

class ScheduleScreen extends StatefulWidget {
   ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
                      "Schedule",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                    _buildTabs(),
                    SizedBox(height: SizeConfig.getProportionateScreenHeight(24)),
                     Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => buildItem(
                          context,
                          index,
                            _activeIndex == 0
                                ?"Assignment":_activeIndex == 1 ?"Quiz" :"Done"
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: SizeConfig.getProportionateScreenHeight(12),
                        ),
                        itemCount: 5,
                      ),
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
          itemCount: 3,
          itemBuilder: (context, index) {
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
        return 'Assignments';
      case 1:
        return 'Quizzes';
      case 2:
        return 'Done';

      default:
        return 'Assignments';
    }
  }

  Widget buildItem(context, index,data) => Container(
    width: SizeConfig.screenWidth,
    height: SizeConfig.getProportionateScreenHeight(80),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: HexColor("0053CB").withOpacity(0.1),
          offset: Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionateScreenWidth(16),
        vertical: SizeConfig.getProportionateScreenHeight(12)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$data ${index+1}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: HexColor("2F80ED").withOpacity(0.2),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(8),
                  vertical: SizeConfig.getProportionateScreenHeight(5)),
              child: Text("Artificial Intelligence",style: TextStyle(fontSize: 10,color: HexColor("2F80ED")),),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            SvgPicture.asset('assets/images/watch.svg',width: 12,height: 12,color: Colors.black,),
            Text("17th of April: 10:00 PM GMT+2"),
          ],
        )
      ],
    ),
  );
}
