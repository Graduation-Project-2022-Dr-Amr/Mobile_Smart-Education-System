import '../../../data/Models/student_register_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeRoleState extends AppStates {}

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
  //final UserModel loginUserModel;

  LoginSuccessState();
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
