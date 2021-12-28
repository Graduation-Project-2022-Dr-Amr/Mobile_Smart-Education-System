import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_signin/NavigationBar_Screens/profilescreen.dart';
import 'communicationscreen.dart';
import 'homescreen.dart';
import 'notifactionscreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ComunityScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: HexColor('2F80ED'),
        unselectedItemColor: HexColor('BDBDBD'),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 24,
            ),
            label: 'Community',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active_outlined,
            ),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
      bottomSheet: buildBottomSheet(context),
    );
  }
}

void show(BuildContext ctx) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (ctx) => InkWell(
            onTap: () {
              Navigator.pop(ctx);
            },
            child: Container(
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [HexColor('2F80ED'), HexColor('FFFFFF'),],
                  //
                  // ),
                  color: HexColor('0053CB'),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.5221))),
              height: MediaQuery.of(ctx).size.height * 0.1090712742980562,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(ctx).size.width * 0.1869158878504673,
                    height: 2,
                    color: HexColor('C4E2FC'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(ctx).size.height * 0.0086393088552916,
                  ),
                  Container(
                    width: MediaQuery.of(ctx).size.width * 0.0934579439252337,
                    height: 2,
                    color: HexColor('C4E2FC'),
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(ctx).size.height * 0.0259179265658747),
                  Text(
                    'CONTINUE STUDYING',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: HexColor('FFFFFF'),
                      //height: 21.48,
                    ),
                  ),
                ],
              ),
            ),
          ));
}

Widget buildBottomSheet(BuildContext ctx) => InkWell(
      onTap: () {
        show(ctx);
      },
      child: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [HexColor('2F80ED'), HexColor('FFFFFF'),],
            //
            // ),
            color: HexColor('0053CB'),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.5221))),
        height: 10,
        alignment: Alignment.center,

      ),
    );
