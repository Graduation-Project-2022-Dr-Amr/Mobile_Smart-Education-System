import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/API/Models/user_data_model.dart';
import '../../../API/Models/admin_model.dart';
import '../../../API/Models/login_model.dart';
import '../../../API/Models/register_model.dart';
import '../../../API/api/dio_helper.dart';
import '../../../API/api/endPoints.dart';
import '../../../shared/Components/commponents.dart';
import 'bloc_states.dart';

class AuthBloc extends Cubit<AppStates> {
  AuthBloc() : super(AppInitialState());

  static AuthBloc get(context) => BlocProvider.of(context);
  bool isInstructor = true;
  bool showPassword = false;
  bool showPassword2 = false;

  bool isChecked = false;
  bool isChecked2 = false;
  IconData suffixIcon1 = Icons.visibility;
  IconData suffixIcon2 = Icons.visibility;

  void changeSuffexIcon() {
    showPassword = !showPassword;
    if (showPassword) {
      suffixIcon1 = Icons.visibility_off;
    } else {
      suffixIcon1 = Icons.visibility;
    }
    emit(SuffixIconState());
    emit(SuffixIconState());
  }

  void toggleShowPassword1() {
    showPassword = !showPassword;
    suffixIcon1 = showPassword ? Icons.visibility_off : Icons.visibility;
    emit(SuffixIconState());
  }

  void toggleShowPassword2() {
    showPassword2 = !showPassword2;
    suffixIcon2 = showPassword2 ? Icons.visibility_off : Icons.visibility;
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
      data: {"username": "mohamed", "password": "01203"},
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
  RegisterModel? registerModel;

  void registerMethod({
    required String username,
    required String email,
    required String password,
    required String password2,
    required String user_type,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "username": username,
        "email": email,
        "password": password,
        "password2": password2,
        "profile": {"user_type": user_type}
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (kDebugMode) {
        print('============User Information=================================');
        print('User Name  is =>> ${registerModel!.user!.username}');
        print('User Email is =>>${registerModel!.user!.email}');
        print('User token is =>>${registerModel!.token}');
        print('User profile is =>>${registerModel!.profile}');
        print('=============================================================');
      }
      emit(SignUpSuccessState(registerModel!));
    }).catchError((error) {
      if (error is DioError) {
        if (error.response!.statusCode != 200) {
          print(error.response!.toString());
          showMyToast(
            text: error.response.toString(),
            state: ToastStates.ERROR,
          );
        }
      }
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
        print('User profile is =>>${loginModel!.profile}');
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

  UserData? userData;
////////////////////////////////////////////////////////////////////////////////
  ///
  void getUserById({required int id}) {
    emit(UserDataLoadingState());
    DioHelper.postData(url: USER_PROFILE + id.toString()).then((value) {
      userData = UserData.fromJson(value.data);
      if (kDebugMode) {
        print('============User Login Data =========================');
        print('User Login Data  =>> ${value.data}');
        print('User Id is =>>${userData?.user}');
        print('User profile is =>>${userData?.picture}');
        print('=====================================================');
      }
      emit(UserDataSuccessState(userData!));
    }).catchError((error) {
      emit(LoginErrorState());
      if (kDebugMode) {
        print('=====================================================');
        print('Error in Get Data METHOD method${error.toString()}');
        print('=====================================================');
      }
    });
  }
}

//////////////////////////////////////////////////////////////////////////////

