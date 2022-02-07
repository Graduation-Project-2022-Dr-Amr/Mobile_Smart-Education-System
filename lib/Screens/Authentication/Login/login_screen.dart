import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Screens/Authentication/Signin/sign_screen.dart';
import 'package:smart_education/Screens/Joining%20University/search_for_colleges_screen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => Mybloc(),
      child: BlocConsumer<Mybloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getProportionateScreenWidth(16),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Logo.svg',
                                fit: BoxFit.contain,
                                width: SizeConfig.getProportionateScreenWidth(
                                    268.66),
                                height: SizeConfig.getProportionateScreenHeight(
                                    62.3),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionateScreenHeight(40.7),
                          ),
                          Container(
                            width: SizeConfig.getProportionateScreenWidth(353),
                            height: SizeConfig.getProportionateScreenHeight(24),
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
                            height: SizeConfig.getProportionateScreenHeight(24),
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
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          8),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a valid User Email';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
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
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          24),
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
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          8),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 8) {
                                      return 'Password is to short at least 8 ';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    if (formKey.currentState!.validate()) {
                                      // Mybloc.get(context).userLogin(
                                      //   email: emailController.text,
                                      //   password: passwordController.text,
                                      // );
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                  maxLines: 1,
                                  cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                                  textAlign: TextAlign.start,
                                  obscureText: Mybloc.get(context).isObsecure,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Mybloc.get(context).suffixIcon,
                                        color: HexColor('0053CB'),
                                      ),
                                      onPressed:
                                          Mybloc.get(context).changeSuffexIcon,
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
                                      SizeConfig.getProportionateScreenHeight(
                                          23),
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
                                      SizeConfig.getProportionateScreenHeight(
                                          318),
                                ),
                                Container(
                                  //56 396
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          65),
                                  width: SizeConfig.getProportionateScreenWidth(
                                      396),
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
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
                                  height:
                                      SizeConfig.getProportionateScreenHeight(
                                          24),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
