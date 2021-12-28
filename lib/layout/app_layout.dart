import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signin/Logics/StateManagement/Bloc/bloc.dart';
import 'package:login_signin/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:login_signin/Screens/Joining%20University/search_for_colleges_screen.dart';
import 'package:login_signin/shared/commponents.dart';


class SmartEducation extends StatelessWidget {
  const SmartEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Mybloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Mybloc.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                cubit.changeAppDirection();
              },
              icon: Icon(
                Icons.change_circle_outlined,
              ),
            ),
            title: appBarText(context),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    Mybloc.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_rounded,
                  )),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, spreadRadius: 0, blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                items: cubit.isRtl
                    ? cubit.bottomItemsArabic
                    : cubit.bottomItemsEnglish,
                currentIndex: cubit.currentIndex,
                onTap: (index) => cubit.changeBottomNavBar(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
