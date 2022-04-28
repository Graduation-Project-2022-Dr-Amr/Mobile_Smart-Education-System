import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Screens/NavigationBar_Screens/More%20Screens/todo_part/size_config.dart';

class RecentActivityScreen extends StatelessWidget {
  RecentActivityScreen({Key? key}) : super(key: key);

  List imagesUrls = [
    "assets/images/assign_done.svg",
    "assets/images/comment_done.svg",
    "assets/images/quiz_done.svg",
  ];

  List strings1 = [
    "Submitted ",
    "Commented ",
    "Submitted ",
  ];

  List strings2 = [
    "Assignment 3",
    "on Introduction: Wh...",
    "Quiz 5",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent activities",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: HexColor("0053CB"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return buildItem(index);
          }),
    );
  }

  Widget buildItem(int index) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            /// todo: navigate to the task
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(12),vertical:SizeConfig.getProportionateScreenWidth(24)),
            width: SizeConfig.screenWidth,
            child: Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.getProportionateScreenWidth(16),
                  backgroundColor: HexColor("0053CB").withOpacity(0.1),
                  child: SvgPicture.asset(
                    imagesUrls[index],
                    color: HexColor("0053CB"),
                    width: SizeConfig.getProportionateScreenWidth(13),
                    height: SizeConfig.getProportionateScreenWidth(13),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            strings1[index],
                            style: TextStyle(fontSize: 14),
                          ),
                          Flexible(
                              child: Text(
                            strings2[index],
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getProportionateScreenHeight(4),),
                      Text(
                        "17th of March: 10:00PM",
                        style: TextStyle(fontSize: 14,color: HexColor("909090")),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: HexColor("2F80ED").withOpacity(0.2),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getProportionateScreenWidth(8),
                      vertical: SizeConfig.getProportionateScreenHeight(5)),
                  child: Text(
                    "Artificial Intelligence",
                    style: TextStyle(fontSize: 10, color: HexColor("2F80ED")),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(height: 0,thickness: 1,indent: SizeConfig.getProportionateScreenWidth(12),endIndent: SizeConfig.getProportionateScreenWidth(12),)

      ],
    );
  }
}
