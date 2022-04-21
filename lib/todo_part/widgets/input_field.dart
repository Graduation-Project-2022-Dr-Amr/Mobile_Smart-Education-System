import 'package:flutter/material.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  final String title;

  final String hint;

  final TextEditingController? controller;
  final Widget? widget;

  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

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
        Container(
          //alignment: Alignment.center,
          height: title == "Note" /*AppLocalizations.of(context)!.note*/
              ? 120
              : 50,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: title == "Note" ? 10 : 1,
                  /*AppLocalizations.of(context)!.note*/
                  readOnly: widget == null ? false : true,
                  cursorColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white54
                      : Colors.black54,
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: title == "Note"
                      ? TextInputType.multiline
                      : TextInputType.text,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Colors.white.withOpacity(0)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Colors.white.withOpacity(0)),
                    ),
                  ),
                ),
              ),
              widget == null ? Container() : widget!
            ],
          ),
        )
      ],
    );
  }
}
