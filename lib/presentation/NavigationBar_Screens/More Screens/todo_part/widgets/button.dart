import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import '../theme.dart';


class Button extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final Color color;
  const Button({Key? key, required this.onTap, required this.label, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        child: Row(
          children: [
            const Icon(Icons.add,color: Colors.white,),
            const SizedBox(width: 8),
            Text(label,style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
    );
  }
}
