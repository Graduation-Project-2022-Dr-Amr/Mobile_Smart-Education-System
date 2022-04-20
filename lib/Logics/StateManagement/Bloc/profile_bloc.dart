import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_states.dart';

class ProfileBloc extends Cubit<AppStates> {
  ProfileBloc() : super(AppInitialState());

  static ProfileBloc get(context) => BlocProvider.of(context);
  File? profileImage;


  bool isEdit = false;
  String editText = 'تعديل';

}
