
import 'package:smart_education/API/Models/login_model.dart';

import '../../../API/Models/student_register_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}
class ChangeModeState extends AppStates {}

class ChangeRoleState extends AppStates {}
class ChangeStepIndex extends AppStates {}

class ChangeCheckBoxState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeDirectionState extends AppStates {}

class AppBottomNavState extends AppStates {}

class SuffixIconState extends AppStates {}

class AppSearchedLoadingState extends AppStates {}

class AppSearchedLoadedState extends AppStates {}


class AppSearchedErrorState extends AppStates {
  final String error;

  AppSearchedErrorState(this.error);
}

///Login State
class LoginLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {
  final LoginModel loginUserModel;

  LoginSuccessState(this.loginUserModel);
}

class LoginErrorState extends AppStates {}

///End of Login State


///SignUp State
class SignUpLoadingState extends AppStates {}

class SignUpSuccessState extends AppStates {
  final StudentRegisterModel registerModel;

  SignUpSuccessState(this.registerModel);
}

class SignUpErrorState extends AppStates {}


/// courses
class CourseLoadingState extends AppStates {}

class CourseSuccessState extends AppStates {}

class CourseErrorState extends AppStates {}

/// chapter Details

class ChapterLoadingState extends AppStates {}

class ChapterSuccessState extends AppStates {}

class ChapterErrorState extends AppStates {}

/// Video Details

class VideoLoadingState extends AppStates {}

class VideoSuccessState extends AppStates {}

class VideoErrorState extends AppStates {}



/*/////////////////////////////////////////////////// */

class AdminLoadingState extends AppStates {}

class AdminSuccessState extends AppStates {}

class AdminErrorState extends AppStates {}
/*/////////////////////////////////////////////////// */
class LogoutLoadingState extends AppStates {}

class LogoutSuccessState extends AppStates {}

class LogoutErrorState extends AppStates {}