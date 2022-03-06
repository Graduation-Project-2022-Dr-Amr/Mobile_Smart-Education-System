import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/NavigationBar_Screens/start_screen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class Colleges extends StatefulWidget {
  Colleges({Key? key}) : super(key: key);

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  TextEditingController joinClass = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> allcolleges = [
    {
      "id": 1,
      "title": "Zagazig University",
      'body': 'Az Zagazig, Ash Sharkia government, Egypt',
    },
    {
      "id": 2,
      "title": "Ain Shams",
      'body': 'Cairo, Cairo government, Egypt',
    },
    {
      "id": 3,
      "title": "cairo",
      'body': 'Alexandria, Alexandria government, Egypt',
    },
    {
      "id": 3,
      "title": "cairo",
      'body': 'Alexandria, Alexandria government, Egypt',
    },
    {
      "id": 3,
      "title": "cairo",
      'body': 'Alexandria, Alexandria government, Egypt',
    },
    {
      "id": 3,
      "title": "cairo",
      'body': 'Alexandria, Alexandria government, Egypt',
    },
  ];

  List<Map<String, dynamic>> foundcollege = [];

  @override
  initState() {
    foundcollege = allcolleges;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = allcolleges;
    } else {
      results = allcolleges
          .where((user) =>
          user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      foundcollege = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(16),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.getProportionateScreenHeight(61)),
            Container(
              width: SizeConfig.getProportionateScreenWidth(396),
              height: SizeConfig.getProportionateScreenHeight(56),
              child: TextFormField(
                onChanged: (value) => _runFilter(value),
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
                      color: HexColor('0053CB'),
                    ),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .0259179266,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .0259179266,
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
                      color: HexColor('0053CB'),
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
                  focusColor: Colors.yellow,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getProportionateScreenHeight(30),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: foundcollege.isNotEmpty
                    ? Column(
                  children: List.generate(foundcollege.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          key: ValueKey(foundcollege[index]["id"]),
                          minVerticalPadding: 0,
                          contentPadding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(18),right: SizeConfig.getProportionateScreenWidth(12)),
                          title: Text(
                            foundcollege[index]['title'].toString(),
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 18,
                              color: HexColor('0053CB'),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          subtitle: Text(
                            foundcollege[index]['body'].toString(),
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor('0053CB'),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('0053CB'),
                            size: SizeConfig.getProportionateScreenWidth(20),
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (innerContext) {
                                  return AlertDialog(
                                    // actionsPadding:
                                    // EdgeInsetsDirectional.only(
                                    //   start: MediaQuery.of(context)
                                    //       .size
                                    //       .width *
                                    //       0.0560747663551402,
                                    //   end: MediaQuery.of(context)
                                    //       .size
                                    //       .width *
                                    //       0.0560747663551402,
                                    // ),
                                    backgroundColor: HexColor('FFFFFF'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    scrollable: true,
                                    actions: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: SizeConfig
                                                .getProportionateScreenHeight(
                                                28),
                                            horizontal: SizeConfig
                                                .getProportionateScreenWidth(
                                                20)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width: SizeConfig
                                                        .getProportionateScreenWidth(
                                                        4)),
                                                Icon(
                                                  Icons.arrow_back_ios,
                                                  color:
                                                  HexColor('0053CB'),
                                                  size: SizeConfig.getProportionateScreenWidth(20),
                                                ),
                                                Text(
                                                  'Back',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontStyle:
                                                    FontStyle.normal,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: HexColor(
                                                        '0053CB'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  22),
                                            ),
                                            Text(
                                              'Members only — Please enter university course code to join.',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontStyle:
                                                FontStyle.normal,
                                                fontWeight:
                                                FontWeight.w500,
                                                color: HexColor('0053CB'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  40),
                                            ),
                                            Text(
                                              'Code',
                                              style: TextStyle(
                                                fontWeight:
                                                FontWeight.w500,
                                                fontStyle:
                                                FontStyle.normal,
                                                fontSize: 14,
                                                color: HexColor(
                                                    '0053CB'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  8),
                                            ),
                                            Form(
                                              child: Container(
                                                width: SizeConfig
                                                    .getProportionateScreenWidth(
                                                    348),
                                                height: SizeConfig
                                                    .getProportionateScreenHeight(
                                                    56),
                                                child: TextFormField(
                                                  // validator: (value) {
                                                  //   if (value!.isEmpty ||
                                                  //       value.length <
                                                  //           8) {
                                                  //     return 'Code Must be 8-digits !';
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  controller: joinClass,
                                                  keyboardType:
                                                  TextInputType.text,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue),
                                                  maxLines: 1,
                                                  cursorColor:
                                                  Color.fromRGBO(180,
                                                      26, 26, 1.0),
                                                  textAlign:
                                                  TextAlign.start,
                                                  textInputAction:
                                                  TextInputAction
                                                      .done,
                                                  decoration:
                                                  InputDecoration(
                                                    hintText:
                                                    'University code [8-digits]',
                                                    hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontStyle: FontStyle
                                                          .normal,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: HexColor(
                                                          'C4E2FC'),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                        color: HexColor(
                                                            'E3F2FD'),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                        color:
                                                        Colors.blue,
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                        color:
                                                        Colors.green,
                                                      ),
                                                    ),
                                                    border:
                                                    OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                        color: Colors
                                                            .black12,
                                                      ),
                                                    ),
                                                    focusColor:
                                                    Colors.yellow,
                                                  ),
                                                ),
                                              ),
                                              key: formKey,
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  24),
                                            ),
                                            Container(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  56),
                                              width: SizeConfig
                                                  .getProportionateScreenWidth(
                                                  348),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    Color(0xFF0D47A1),
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),
                                              child: MaterialButton(
                                                child: Text("Join",
                                                    style: TextStyle(
                                                        color: HexColor(
                                                            'FFFFFF'),
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontStyle:
                                                        FontStyle
                                                            .normal)),
                                                onPressed: () {
                                                  if (formKey
                                                      .currentState!
                                                      .validate()) {
                                                    navigateTo(context,
                                                        StartScreen());
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                            'Processing Data'),
                                                        duration: Duration(
                                                            milliseconds:
                                                            2),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                  .getProportionateScreenHeight(
                                                  16),
                                            ),
                                            Center(
                                              child: Text(
                                                'Explore available courses',
                                                style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontStyle:
                                                  FontStyle.normal,
                                                  fontSize: 18,
                                                  color: HexColor(
                                                      '2F80ED'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionateScreenHeight(3),
                        ),
                        Divider(
                          color: HexColor('0053CB'),
                          height: 1,
                        ),
                      ],
                    );
                  }),
                )
                    : const Text(
                  'No results found',
                  textScaleFactor: 1.0,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
