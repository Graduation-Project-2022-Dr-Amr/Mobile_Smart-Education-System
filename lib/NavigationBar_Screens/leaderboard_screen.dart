import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _ComunityScreenState createState() => _ComunityScreenState();
}

class _ComunityScreenState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [Text('LeaderBoard Design')],
            ),
          ),
        ),
      ),
    );
  }
}
