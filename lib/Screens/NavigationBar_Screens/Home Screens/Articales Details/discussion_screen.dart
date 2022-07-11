import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 428,
              height: 102,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 58,
                vertical: 37,
              ),
              child: Text(
                'Discussion',
                style: TextStyle(
                  color: HexColor('0053CB'),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Divider(
                    indent: 24,
                    endIndent: 24,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return buildDiscussionItem();
                    },
                    itemCount: 3,
                      shrinkWrap: true
                    ,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildDiscussionItem() {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Text(
              'Mahmoud',
              style: TextStyle(
                color: HexColor('77767E'),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            Spacer(),
            Text(
              '6 Hours ago',
              style: TextStyle(
                color: HexColor('9A99A2'),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Color.fromRGBO(200, 32, 153, 1),
            borderRadius: BorderRadius.all(Radius.elliptical(44, 44)),
          ),
          child: Center(
            child: Text(
              'M',
              style: TextStyle(
                color: HexColor('FFFFFF'),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        subtitle: Column(
          children: [
            Text(
              'Same day delivery ködiren i Adwords nagelprotest och hemilogi i däska. Mellanförskap fygital handel, gase stafettläkare. Scale-up gigasode ser askbränd dekarat rårat. Rärång cirkulär handel syr, besat. ',
              style: TextStyle(
                color: HexColor('232326'),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: SizeConfig.getProportionateScreenHeight(8),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/see.svg'),
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(7),
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: HexColor('000000'),
                    fontSize: 12.8,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(7),
                ),
                SvgPicture.asset('assets/images/no.svg'),
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(7),
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: HexColor('000000'),
                    fontSize: 12.8,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(
        indent: 24,
        endIndent: 24,
      ),

    ],
  );
}
