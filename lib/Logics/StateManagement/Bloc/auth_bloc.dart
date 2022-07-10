import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/data/Models/student_register_model.dart';
import 'package:smart_education/data/api/dio_helper.dart';
import 'package:smart_education/data/api/endPoints.dart';
import 'bloc_states.dart';

class AuthBloc extends Cubit<AppStates> {
  AuthBloc() : super(AppInitialState());

  static AuthBloc get(context) => BlocProvider.of(context);
  bool isInstructor = true;
  bool showPassword = false;

  bool isChecked = false;
  IconData suffixIcon = Icons.remove_red_eye_outlined;

  void changeSuffexIcon() {
    showPassword = !showPassword;
    if (showPassword) {
      suffixIcon = Icons.visibility_off;
    } else {
      suffixIcon = Icons.visibility;
    }
    emit(SuffixIconState());
    emit(SuffixIconState());
  }

  void changeRole() {
    isInstructor = !isInstructor;
    emit(ChangeRoleState());
  }

  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangeCheckBoxState());
  }


  // void LoginMethod({
  //   required String username,
  //   required String password,
  // }) {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(
  //     url: LOGIN,
  //     token: TOKEN,
  //     data: {
  //       'username': username,
  //       'password': password,
  //     },
  //   ).then((value) {
  //     user = UserModel.fromJson(value.data);
  //     print('============User Information===========');
  //     print('User Id is =>>${value.data['user_id']}');
  //     print('User Token is =>> ${value.data['token']}');
  //     print('=======================================');
  //     emit(LoginSuccessState(user!));
  //   }).catchError((error) {
  //     emit(LoginErrorState());
  //     print('=======================================');
  //     print('Error in LOGIN METHOD method${error.toString()}');
  //     print('=======================================');
  //   });
  // }

  //////////////////////////////////////////////////////////////////////////////
  StudentRegisterModel? registerModel;
  void RegisterMethod({
    required String username,
    required String email,
    required String password,
    required String confirm_password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: StudentREGISTER,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'password2': confirm_password,
      },
    ).then((value) {
      registerModel = StudentRegisterModel.fromJson(value.data);
      if (kDebugMode) {
        print('============User Information=================================');
        print('User Name  is =>> ${registerModel!.user!.username}');
        print('User Email is =>>${registerModel!.user!.email}');
        print('User Account State  is =>> ${registerModel!.user!.isStudent}');
        print('=============================================================');
      }
      emit(SignUpSuccessState(registerModel!));
    }).catchError((error) {
      emit(SignUpErrorState());
      if (kDebugMode) {
        print('=======================================');
        print('Error in REGISTER METHOD method${error.toString()}');
        print('=======================================');
      }
    });
  }

////////////////////////////////////////////////////////////////////////////////
}
