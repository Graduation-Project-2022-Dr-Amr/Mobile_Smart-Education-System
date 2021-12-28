import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/NavigationBar_Screens/homescreen.dart';
import 'package:login_signin/NavigationBar_Screens/start_screen.dart';
import 'package:login_signin/shared/commponents.dart';

class Colleges extends StatefulWidget {
  Colleges({Key? key}) : super(key: key);

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  TextEditingController joinClass=TextEditingController();
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
          .where((user) => user["title"]
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9252336448598131,
                height: MediaQuery.of(context).size.height * 0.060475161987041,
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
                      height: MediaQuery.of(context).size.height * .0259179266,
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
                height: MediaQuery.of(context).size.height * 0.0485961123,
              ),
              Expanded(
                child: foundcollege.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: foundcollege.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            color: HexColor('FFFFFF'),
                            child: Column(
                              children: [
                                ListTile(
                                  key: ValueKey(foundcollege[index]["id"]),
                                  title: Text(
                                    foundcollege[index]['title'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: HexColor('0053CB'),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  subtitle: Text(
                                    foundcollege[index]['body'].toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor('0053CB'),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: HexColor('0053CB'),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (innerContext) {
                                            return AlertDialog(
                                              actionsPadding:
                                                  EdgeInsetsDirectional.only(
                                                start: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0560747663551402,
                                                end: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0560747663551402,
                                              ),
                                              backgroundColor: HexColor('FFFFFF'),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              scrollable: true,
                                              actions: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0367170626349892,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_back_ios,
                                                      color: HexColor('0053CB'),
                                                      //size: 2,
                                                    ),
                                                    Text(
                                                      'Back',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            HexColor('0053CB'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0237580993520518,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Members only — Please enter university \ncourse code to join.',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            HexColor('0053CB'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0431965442764579,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Code',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        color:
                                                            HexColor('0053CB'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0086393088552916,
                                                ),
                                                Form(
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.9252336448598131,
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.060475161987041,
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        if (value!.isEmpty|| value.length < 8) {
                                                          return 'Code Must be 8-digits !';
                                                        }
                                                        return null;
                                                      },
                                                      controller:joinClass ,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.blue),
                                                      maxLines: 1,
                                                      cursorColor: Color.fromRGBO(
                                                          180, 26, 26, 1.0),
                                                      textAlign: TextAlign.start,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            'University code [8-digits]',
                                                        hintStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              HexColor('C4E2FC'),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: HexColor(
                                                                'E3F2FD'),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Colors.black12,
                                                          ),
                                                        ),
                                                        focusColor: Colors.yellow,
                                                      ),
                                                    ),
                                                  ),
                                                  key: formKey,

                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0259179265658747,
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .060475162,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .9252336449,
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
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal)),
                                                    onPressed: () {
                                                      if (formKey.currentState!.validate()) {
                                                        navigateTo(context, StartScreen());
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(
                                                            content: Text('Processing Data'),
                                                            duration: Duration(milliseconds: 2),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0172786177105832,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Explore available courses',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 18,
                                                        color:
                                                            HexColor('2F80ED'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0345572354211663,
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0064794816,
                                ),
                                Divider(
                                  color: HexColor('0053CB'),
                                  height: 1,
                                ),
                              ],
                            ),
                          );
                        })
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
