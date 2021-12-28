abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeDirectionState extends AppStates {}

class NewsBottomNavState extends AppStates {}

class AppSearchedLoadingState extends AppStates {}

class AppSearchedLoadedState extends AppStates {}

class AppSearchedErrorState extends AppStates {
  final String error;

  AppSearchedErrorState(this.error);
}
