import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../API/Models/admin_model.dart';
import '../../../API/Models/login_model.dart';
import '../../../API/Models/student_register_model.dart';
import '../../../API/api/dio_helper.dart';
import '../../../API/api/endPoints.dart';
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
//////////////////////////////////////////////////////////////////////////////
  AdminModel? adminModel;
  void getAdminToken() {
    emit(AdminLoadingState());
    DioHelper.postData(
      url: ADMINLOGIN,
      data:     {
        "username": "mohamed",
        "password": "01203"
      },
    ).then((value) {
      adminModel = AdminModel.fromJson(value.data);
      if (kDebugMode) {
        print('Admin Token == >> ${adminModel!.token}');
        print('Admin Id == >> ${adminModel!.userId}');
        print('Admin State == >> ${adminModel!.isStudent}');
      }
      emit(AdminSuccessState());
    }).catchError((error) {
      emit(AdminErrorState());
      if (kDebugMode) {
        print('Error in Admin Method == >> ${error.toString()}');
      }
    });
  }

  //////////////////////////////////////////////////////////////////////////////
  StudentRegisterModel? registerModel;
  void registerMethod({
    required String username,
    required String email,
    required String password,
    required String confirm_password,
  }) {
    getAdminToken();
    emit(SignUpLoadingState());
    print(adminModel!.token);
    DioHelper.postData(
      url: isInstructor ? TeacherREGISTER : StudentREGISTER,
      data: {
        "username":username,
        "email":email,
        "password":password,
        "password2":confirm_password
      },
      token: adminModel!.token
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
//////////////////////////////////////////////////////////////////////////////
  LoginModel? loginModel;
  void loginMethod({
    required String username,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'username': username,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      if (kDebugMode) {
        print('============User Login Data =========================');
        print('User Login Data  =>> ${value.data}');
        print('User Id is =>>${loginModel!.userId}');
        print('User Token is =>>${loginModel!.token}');
        print('=====================================================');
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState());
      if (kDebugMode) {
        print('=====================================================');
        print('Error in LOGIN METHOD method${error.toString()}');
        print('=====================================================');
      }
    });
  }
//////////////////////////////////////////////////////////////////////////////
  void logOut() {
    emit(LogoutLoadingState());
    DioHelper.postData(
      url: LOGOUT,
    ).then((value) {
      if (kDebugMode) {
        print('============User Logout Data =========================');
        print('User Logout Data  =>> ${value.data}');
        print('=====================================================');
      }
      emit(LogoutSuccessState());
    }).catchError((error) {
      emit(LogoutErrorState());
    });
  }
////////////////////////////////////////////////////////////////////////////////
}
