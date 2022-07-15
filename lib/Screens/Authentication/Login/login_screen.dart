import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/auth_bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Layout/app_layout.dart';
import 'package:smart_education/Screens/Authentication/Signin/sign_screen.dart';
import 'package:smart_education/shared/Components/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import '../../../API/api/cacheHelper.dart';
import '../../../API/api/endPoints.dart';
import '../../../shared/Components/input_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AppStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Future.wait([
              CacheHelper.saveData(key: 'userId', value: state.loginUserModel.userId),
              CacheHelper.saveData(key: 'token', value: state.loginUserModel.token)
            ]).then(
              (value) {
                TOKEN = state.loginUserModel.token;
                navigateandFinish(context, AppLayout());
              },
            );
          } else if (state is LoginErrorState) {
            showMyToast(
                text: 'Username/Email not matching with password, please try again. ', state: ToastStates.ERROR);
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
                  children: <Widget>[
                    SizedBox(height: SizeConfig.getProportionateScreenHeight(50)),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/Logo.svg',
                        fit: BoxFit.contain,
                        height: SizeConfig.getProportionateScreenHeight(62.3),
                        width: SizeConfig.getProportionateScreenWidth(268.66),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(40.7),
                    ),
                    Text(
                      AppLocalizations.of(context)!.to_get_started_login_to_your_account,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
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
                          //Email
                          buildColumn(text: AppLocalizations.of(context)!.user_name),
                          InputFieldWidget(
                            controller: userNameController,
                            // onSubmit: (value) {
                            //   if (value!.isEmpty ||
                            //       !value.contains('@') ||
                            //       !value.contains('.')) {
                            //     return 'Enter a valid User Email!';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.emailAddress,
                            hint: AppLocalizations.of(context)!.enter_your_name,
                            fieldKey: "user name",
                          ),
                          // SizedBox(
                          //   height: SizeConfig.getProportionateScreenHeight(24),
                          // ),
                          //Password
                          buildColumn(text: AppLocalizations.of(context)!.password),
                          InputFieldWidget(
                            controller: passwordController,
                            // onSubmit: (value) {
                            //   if (value!.isEmpty || value.length < 8) {
                            //     return 'Password is to short at least 8 !';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.text,

                            hint: AppLocalizations.of(context)!.enter_your_password,
                            fieldKey: "password",
                          ),
                          // SizedBox(
                          //   height: SizeConfig.getProportionateScreenHeight(23),
                          // ),
                          Text(
                            AppLocalizations.of(context)!.reset_your_password,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: HexColor('0053CB'),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(318),
                          ),
                          Container(
                            //56 396
                            height: SizeConfig.getProportionateScreenHeight(56),
                            width: SizeConfig.getProportionateScreenWidth(396),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF0D47A1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: MaterialButton(
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AuthBloc.get(context).loginMethod(
                                    username: userNameController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(24),
                          ),
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                navigateTo(context, SignUpScreen());
                              },
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.dont_have_an_account,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor('1E88E5'),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.sign_up,
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

  Column buildColumn({required String text}) {
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: HexColor('0053CB'),
            fontSize: 14,
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
