import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Profile Screen Design',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
