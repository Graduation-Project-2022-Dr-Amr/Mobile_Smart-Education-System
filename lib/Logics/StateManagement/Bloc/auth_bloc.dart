import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/data/Models/userModel.dart';
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
  UserModel? userModel;

  void LoginMethod({
    required String username,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      token: TOKEN,
      data: {
        'username': username,
        'password': password,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('============User Information===========');
      print('User Id is =>>${value.data['user_id']}');
      print('User Token is =>> ${value.data['token']}');
      print('=======================================');
      emit(LoginSuccessState(userModel!));
    }).catchError((error) {
      emit(LoginErrorState());
      print('=======================================');
      print('Error in LOGIN METHOD method${error.toString()}');
      print('=======================================');
    });
  }



  void RegisterMethod({
    required String username,
    required String email,
    required String password,
    required String confirm_password,
    required bool is_student,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: REGISTER,
      token: TOKEN,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'password2': confirm_password,
        'is_student': is_student
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('============User Information===========');
      print('User Email is =>>${value.data['email']}');
      print('User Check  is =>> ${value.data['is_student']}');
      print('User Account State  is =>> ${value.data['message'].toString()}');
      print('User Token  is =>> ${value.data['token'].toString()}');
      print('=======================================');
      emit(SignUpSuccessState(userModel!));
    }).catchError((error) {
      emit(SignUpErrorState());
      print('=======================================');
      print('Error in REGISTER METHOD method${error.toString()}');
      print('=======================================');
    });
  }
}
