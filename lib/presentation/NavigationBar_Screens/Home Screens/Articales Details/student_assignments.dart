import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class StudentsAssignment extends StatelessWidget {
  const StudentsAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                  'Assignment',
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
                    Text(
                      'Rlaterade artiklar tånat hynösat läl om trekvartspudel fast megagt om prokotta emedan MVP, prefade. Sygen cirkulent. Accelerator investeringsfrämjande rassade flöde, i bening digitala assistenter, plapov. DALL·E ödar, pongar sitinde prenas en vertikal fenöjigt utom vaska bootstrapping dobel, dinde. Rapp teles, än valpromenera lapont. Dabaligen bamörtad sper som biong hootSuite new retail, som cyberhygien. Ons dejyng dosm utan kluster: att ogisk prel nyrase blockchain såren. Bihet white label danas krolingar sensorteknik och dabaviling. Scale-up bred erfarenhet nynora och niskapet, kask startup som innovationsekosystem. Retailtainment athleisure, favyska, sev bevyliga megabetigisk outbound marketing.',
                      style: TextStyle(
                        color: HexColor('333333'),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(40),
                    ),
                    SizedBox(height: 32),
                    ListTile(
                      title:   Text(
                        'Home Work.pdf',
                        style: TextStyle(
                          color: HexColor('000000'),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(200, 32, 153, 1),
                          borderRadius: BorderRadius.all(Radius.elliptical(44, 44)),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.satellite_sharp
                          )
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
