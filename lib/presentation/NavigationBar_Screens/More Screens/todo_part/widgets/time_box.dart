import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TimeBox extends StatelessWidget {
  final String title ;
  final String hint ;
  final Widget widget;
  final Function() onPressed;

  const TimeBox({Key? key, required this.title, required this.hint,  required this.widget, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 50,
                padding:
                const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(hint),
                    ),
                   widget,
                  ],
                ),
              ),
            ),
          ],
        );
  }
}
