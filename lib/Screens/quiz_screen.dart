import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/constants/size_config.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Map<String, bool?> lightSwitches = {
    'Ans 1': false,
    'Ans 2': false,
    'Ans 3': false,
    'Ans 4': false,
  };

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionateScreenHeight(40),
          horizontal: SizeConfig.getProportionateScreenWidth(23),
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Questrion 1 out of 10',
                    style: TextStyle(
                      color: HexColor('1964D1'),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '*Choose the correct answer for all questions',
                    style: TextStyle(
                      color: HexColor('BDBDBD'),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(24),
              ),
              Text(
                '1: The video that introduced the idea of Hall of Fame and Hall '
                    'of Shame interfaces included a few pieces of design wisdom.'
                    ' Which of the following are true? (Select all that apply)',
                style: TextStyle(
                  color: HexColor('333333'),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(56),
              ),
              Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      'Written instructions in any user interface are a sign of bad design.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: lightSwitches['Ans 1']!
                            ? HexColor('0053CB')
                            : HexColor('333333'),
                      ),
                    ),
                    value: lightSwitches['Ans 1'],
                    onChanged: (bool? value) {
                      setState(() {
                        lightSwitches['Ans 1'] = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'The design principle of Visibility is relevant for both computer interfaces and physical objects.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: lightSwitches['Ans 2']!
                            ? HexColor('0053CB')
                            : HexColor('333333'),
                      ),
                    ),
                    value: lightSwitches['Ans 2'],
                    onChanged: (bool? value) {
                      setState(() {
                        lightSwitches['Ans 2'] = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Responding to a user’s action with multiple types of subtle visual feedback is a good design strategy.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: lightSwitches['Ans 3']!
                            ? HexColor('0053CB')
                            : HexColor('333333'),
                      ),
                    ),
                    value: lightSwitches['Ans 3'],
                    onChanged: (bool? value) {
                      setState(() {
                        lightSwitches['Ans 3'] = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Simple things should be simple to use.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: lightSwitches['Ans 4']!
                            ? HexColor('0053CB')
                            : HexColor('333333'),
                      ),
                    ),
                    value: lightSwitches['Ans 4'],
                    onChanged: (bool? value) {
                      setState(() {
                        lightSwitches['Ans 4'] = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(195),
              ),
              Divider(
                height: 2,
                color: HexColor('BDBDBD'),
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(32),
              ),
              Container(
                width: SizeConfig.getProportionateScreenWidth(316),
                height: SizeConfig.getProportionateScreenHeight(56),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor('FFFFFF'),
                  border: Border.all(
                    color: HexColor('0053CB'),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Next Question',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('0053CB')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
