import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/API/api/cacheHelper.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Screens/Authentication/Login/login_screen.dart';
import 'package:smart_education/Screens/Authentication/Profile/profileScreen.dart';
import 'package:smart_education/shared/Components/commponents.dart';

import '../Logics/StateManagement/Bloc/bloc_states.dart';
import '../shared/constants/size_config.dart';
import '../todo_part/view/all_tasks_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(create:(context)=>Mybloc(),
    child: BlocConsumer<Mybloc,AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionateScreenHeight(40),
                horizontal: SizeConfig.getProportionateScreenWidth(32),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/mahmoud.png',
                          ),
                          maxRadius: 26,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenHeight(16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Devon Lane',
                              style: TextStyle(
                                color: HexColor('4F4F4F'),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                navigateTo(context, ProfileScreen());
                              },
                              child: Text(
                                'View profile',
                                style: TextStyle(
                                  color: HexColor('2F80ED'),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(onPressed: (){
                          Mybloc.get(context).changeMode();
                          if (kDebugMode) {
                            print(Mybloc.get(context).isDark);
                          }
                        }, icon: Icon(Icons.dark_mode)),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(58),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.language,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          'Language',
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(34.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Manage',
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),


                    InkWell(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ToDoScreen())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            width: SizeConfig.getProportionateScreenWidth(10),
                          ),
                          Text(
                            'Activity',
                            style: TextStyle(
                              color: HexColor('4F4F4F'),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    InkWell(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ToDoScreen())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            width: SizeConfig.getProportionateScreenWidth(10),
                          ),
                          Text(
                            'Assignments & Quizzes',
                            style: TextStyle(
                              color: HexColor('4F4F4F'),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    InkWell(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ToDoScreen())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                          ),
                          SizedBox(
                            width: SizeConfig.getProportionateScreenWidth(10),
                          ),
                          Text(
                            'My To Do',
                            style: TextStyle(
                              color: HexColor('4F4F4F'),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(34.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Resource',
                          style: TextStyle(
                            color: HexColor('BDBDBD'),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(18.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.help_outline_sharp,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(21),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outlined,
                        ),
                        SizedBox(
                          width: SizeConfig.getProportionateScreenWidth(10),
                        ),
                        Text(
                          'About us',
                          style: TextStyle(
                            color: HexColor('4F4F4F'),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            CacheHelper.removeData('token').then((value){
                              navigateandFinish(context, LoginScreen());
                            });

                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.red,

                              ),
                              SizedBox(
                                width: SizeConfig.getProportionateScreenWidth(10),
                              ),
                              Text(
                                'Sign out',
                                style: TextStyle(
                                  color: HexColor('EB5757'),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    ),
    );
  }
}
