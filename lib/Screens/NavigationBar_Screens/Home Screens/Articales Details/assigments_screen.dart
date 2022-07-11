import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Screens/NavigationBar_Screens/Home%20Screens/Articales%20Details/student_assignments.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class AssigmentsScreen extends StatelessWidget {
  const AssigmentsScreen({Key? key}) : super(key: key);

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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color:
                                Color.fromRGBO(16, 24, 40, 0.05000000074505806),
                            offset: Offset(0, 1),
                            blurRadius: 2)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: Color.fromRGBO(229, 231, 235, 1),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/images/media.svg'),
                        SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Upload a file ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: HexColor('0053CB'),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    'or drag and drop',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        //color: undefined,
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'PDF, PNG, JPG files, upto 20MB',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(107, 114, 128, 1),
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.4285714285714286),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, StudentsAssignment());
                    },
                    child: Container(
                      width: 388,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  16, 24, 40, 0.05000000074505806),
                              offset: Offset(0, 1),
                              blurRadius: 2)
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(229, 231, 235, 1),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 83, 203, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
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
