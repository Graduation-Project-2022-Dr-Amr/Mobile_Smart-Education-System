import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/Screens/Joining%20University/all_colleges_screen.dart';
import 'package:login_signin/shared/commponents.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  var autocompletecontroller = TextEditingController();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06587473,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06587473,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9252336448598131,
                  height:
                      MediaQuery.of(context).size.height * 0.060475161987041,
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
                      MediaQuery.of(context).size.height * 0.0939524838012959,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/onboarding1.svg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.0809935205183585,
                ),
                Text(
                  'To get started, search for a school',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: HexColor('0053CB'),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height * 0.1652267818574514,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: HexColor('C4E2FC'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.0303738317757009,
                    ),
                    Text(
                      'or simply',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor('C4E2FC'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.0303738317757009,
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
                      MediaQuery.of(context).size.height * 0.0259179265658747,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .060475162,
                  width: MediaQuery.of(context).size.width * .9252336449,
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
      ),
    );
  }
}
