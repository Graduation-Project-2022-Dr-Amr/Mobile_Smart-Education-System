import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/Screens/Joining%20University/search_for_colleges_screen.dart';
import 'package:login_signin/Screens/Authentication/Signin/sign_screen.dart';
import 'package:login_signin/shared/commponents.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void _switch() {
    setState(() {
      isObsecure = !isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/Logo.svg',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .0439524838,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width * 0.7079439252336449,
                      height: MediaQuery.of(context).size.height *
                          0.0259179265658747,
                      child: Text(
                        "To get started — Login to your account.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: HexColor('0053CB'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .0259179266,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Email
                          Text(
                            'Email',
                            style: TextStyle(
                              color: HexColor('0053CB'),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .0086393089,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains('.')) {
                                return 'Enter a valid User Email!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                            maxLines: 1,
                            cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                            textAlign: TextAlign.start,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: HexColor('BBDEFB'),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .0259179266,
                          ),
                          //Password
                          Text(
                            'Password',
                            style: TextStyle(
                              color: HexColor('0053CB'),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .0086393089,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is to short at least 8 !';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                            maxLines: 1,
                            cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                            textAlign: TextAlign.start,
                            obscureText: isObsecure,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                height: MediaQuery.of(context).size.height *
                                    .0259179266,
                                width: MediaQuery.of(context).size.width *
                                    .0259179266,
                                child: IconButton(
                                  onPressed: () {
                                    _switch();
                                  },
                                  icon: Icon(
                                    isObsecure
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off,
                                    color: HexColor('0053CB'),
                                  ),
                                ),
                              ),
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: HexColor('BBDEFB'),
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
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * .024838013,
                          ),
                          Text(
                            'Reset your password?',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: HexColor('0053CB'),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * .343412527,
                          ),
                          Container(
                            height:
                                MediaQuery.of(context).size.height * .060475162,
                            width:
                                MediaQuery.of(context).size.width * .9252336449,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF0D47A1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: MaterialButton(
                              child: Text("Login",
                                  style: TextStyle(
                                      color: HexColor('FFFFFF'),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  navigateTo(context, SearchScreen());
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
                            height: MediaQuery.of(context).size.height *
                                .0159179266,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  navigateTo(context, SignUpScreen());
                                },
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Don’t have an account? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('1E88E5'),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign up',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('1565C0'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .0863930886,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
