import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/API/api/cacheHelper.dart';
import 'package:smart_education/API/api/dio_helper.dart';
import 'package:smart_education/API/api/endPoints.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';

class LeaderBoardBloc extends Cubit<AppStates> {
  LeaderBoardBloc() : super(AppInitialState());

  List<dynamic> leaderBoard = [];

  void getLeaderBoard() {
    DioHelper.getData(url: LEADERBOARD, token: CacheHelper.getData('token')).then((value) {
      print('>> Leader board data is: ${value.data}');
      leaderBoard = value.data;

      emit(CourseSuccessState());
    }).catchError((error) {
      emit(CourseErrorState());
    });
  }
}
