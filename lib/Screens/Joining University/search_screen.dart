import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Screens/Joining%20University/colleges_screen.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  var autocompletecontroller = TextEditingController();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(16)
          ),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.getProportionateScreenHeight(61)),
              Container(
                width: SizeConfig.getProportionateScreenWidth(396),
                height:
                SizeConfig.getProportionateScreenWidth(56),
                child: TextFormField(
                  onTap: () {
                    navigateTo(context, Colleges());
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter some words!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                  maxLines: 1,
                  cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      child: Icon(
                        Icons.search,
                        color: HexColor('C4E2FC'),
                      ),
                      height:
                      MediaQuery.of(context).size.height * .0259179266,
                      width: MediaQuery.of(context).size.width * .0259179266,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: HexColor('C4E2FC'),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('E3F2FD'),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    focusColor: Colors.yellow,
                  ),
                ),
              ),

              SizedBox(
                height:
                SizeConfig.getProportionateScreenHeight(46),
              ),

              SvgPicture.asset(
                'assets/images/Notebook.svg',
                fit: BoxFit.contain,
                width: SizeConfig.screenWidth,
                height: SizeConfig.getProportionateScreenHeight(346),
              ),
              SizedBox(
                height:
                SizeConfig.getProportionateScreenHeight(24),
              ),

              Text(
                'To get started, search for a school',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: HexColor('0053CB'),
                ),
              ),
              SizedBox(
                height:
                SizeConfig.getProportionateScreenHeight(145),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: HexColor('C4E2FC'),
                    ),
                  ),
                  SizedBox(
                    width:
                    SizeConfig.getProportionateScreenWidth(14),
                  ),
                  Text(
                    'or simply',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: HexColor('C4E2FC'),
                    ),
                  ),
                  SizedBox(
                    width:
                    SizeConfig.getProportionateScreenWidth(14),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: HexColor('C4E2FC'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:
                SizeConfig.getProportionateScreenHeight(21),
              ),
              Container(
                height:
                SizeConfig.getProportionateScreenHeight(56),
                width:
                SizeConfig.getProportionateScreenWidth(396),
                decoration: BoxDecoration(
                  color: HexColor('FFFFFF'),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF0D47A1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: HexColor('0053CB'),
                      style: BorderStyle.solid,
                      width: 2),
                ),
                child: MaterialButton(
                  child: Text("Explore all courses ",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: HexColor('0053CB'),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
