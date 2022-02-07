import 'package:flutter/material.dart';

class ComunityScreen extends StatelessWidget {
  const ComunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Communication Screen Design'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
