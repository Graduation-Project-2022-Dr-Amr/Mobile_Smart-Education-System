import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/auth_bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/data/api/endPoints.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import '../../../data/api/cacheHelper.dart';
import '../../../shared/input_field_widget.dart';
import '../../Joining University/explore_all_cources_screeen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AppStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            CacheHelper.saveData(
              key: 'token',
              value: state.registerModel.token,
            ).then((value) {
              TOKEN = state.registerModel.token;
              navigateandFinish(context, SearchScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(50)),
                    Center(
                      child: SvgPicture.asset(
                        'assets/Logo.svg',
                        fit: BoxFit.contain,
                        height: SizeConfig.getProportionateScreenHeight(62.3),
                        width: SizeConfig.getProportionateScreenWidth(268.66),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(40.7),
                    ),
                    Text(
                      "To get started — Please create a new account.",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 18,
                        // height: .0259179266,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: HexColor('0053CB'),
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
                          buildColumn(text: "Name"),
                          InputFieldWidget(
                            controller: nameController,
                            // onSubmit: (value) {
                            //   if (value!.isEmpty ||
                            //       value.contains('@') ||
                            //       value.contains('.')) {
                            //     return 'Enter a valid Name!';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.name,
                            hint: 'Enter your full name',
                            fieldKey: "name",
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          buildColumn(text: "Email"),
                          InputFieldWidget(
                            controller: emailController,
                            // onSubmit: (value) {
                            //   if (value!.isEmpty ||
                            //       !value.contains('@') ||
                            //       !value.contains('.')) {
                            //     return 'Enter a valid User Email!';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Enter your Email',
                            fieldKey: "email",
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          buildColumn(text: "Password"),
                          InputFieldWidget(
                              controller: passwordController,
                              // onSubmit: (value) {
                              //   if (value!.isEmpty || value.length < 8) {
                              //     return 'Password is to short at least 8 !';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.text,
                              hint: 'Enter your Password',
                              fieldKey: "password",
                              suffix: AuthBloc.get(context).suffixIcon,
                              suffixPressed: () {
                                AuthBloc.get(context).changeSuffexIcon();
                              }),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          buildColumn(text: "Confirm Password"),
                          InputFieldWidget(
                              controller: passwordConfirmController,
                              // onSubmit: (value) {
                              //   if (value!.isEmpty || value.length < 8) {
                              //     return 'Password is to short at least 8 !';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.text,
                              hint: 'Enter your Password',
                              fieldKey: "password",
                              suffix: AuthBloc.get(context).suffixIcon,
                              suffixPressed: () {
                                AuthBloc.get(context).changeSuffexIcon();
                              }),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(8),
                          ),
                          Text(
                            'Your Password should be 8 letters or more.',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: HexColor('0053CB'),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          Text(
                            'Please choose your role',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor('0053CB'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(8),
                          ),
                          Row(
                            children: [
                              buildExpanded(
                                context: context,
                                role: "Instructor",
                                isInstructor:
                                    AuthBloc.get(context).isInstructor,
                              ),
                              SizedBox(
                                width:
                                    SizeConfig.getProportionateScreenWidth(16),
                              ),
                              buildExpanded(
                                context: context,
                                role: "Student",
                                isInstructor:
                                    !AuthBloc.get(context).isInstructor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height:
                                    SizeConfig.getProportionateScreenHeight(24),
                                child: Checkbox(
                                  value: AuthBloc.get(context).isChecked,
                                  onChanged: (value) {
                                    AuthBloc.get(context).changeCheckBox();
                                  },
                                  checkColor: Colors.white,
                                  activeColor: HexColor('0053CB'),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.getProportionateScreenWidth(
                                  15,
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'You have read and agree our ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor('1E88E5'),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor('0053CB'),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(77),
                          ),
                          Container(
                            height: SizeConfig.getProportionateScreenHeight(56),
                            width: SizeConfig.getProportionateScreenWidth(396),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor("0D47A1")),
                                  elevation: MaterialStateProperty.all(4),
                                  shadowColor: MaterialStateProperty.all(
                                      HexColor("0053CB").withOpacity(0.25))),
                              child: Text(
                                "Create a new account",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate() ||
                                    nameController.text.trim().isEmpty ||
                                    nameController.text.trim().length < 3 ||
                                    !AuthBloc.get(context).isChecked ||
                                    passwordController.text ==
                                        passwordConfirmController.text) {
                                  AuthBloc.get(context).RegisterMethod(
                                    username: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirm_password:
                                        passwordConfirmController.text,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  navigateTo(context, LoginScreen());
                                },
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Already have an account? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('1E88E5'),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'LogIn',
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
          );
        },
      ),
    );
  }

  Expanded buildExpanded(
      {required BuildContext context,
      required String role,
      required bool isInstructor}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AuthBloc.get(context).changeRole();
          print('check ${isInstructor}');
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          height: SizeConfig.getProportionateScreenHeight(56),
          child: Text(
            role,
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor(!isInstructor ? "BBDEFB" : '0053CB'),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: HexColor(!isInstructor ? "E3F2FD" : '0053CB'), //
            ),
            //color: isInstructor? Colors.white : Colors.lightGreenAccent,
          ),
        ),
      ),
    );
  }

  Column buildColumn({required String text}) {
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: HexColor('0053CB'),
            fontSize: 14,
            //height:0.01727861771 ,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: SizeConfig.getProportionateScreenHeight(8),
        ),
      ],
    );
  }
}
