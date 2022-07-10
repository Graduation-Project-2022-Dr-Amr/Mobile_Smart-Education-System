import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartEdu/shared/constants/size_config.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  //final Function onSubmit;
  final TextInputType keyboardType;
  final String hint;
  final String fieldKey;

  const InputFieldWidget(
      {Key? key,
      required this.controller,
      //required this.onSubmit,
      required this.keyboardType,
      required this.hint,
      required this.fieldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getProportionateScreenHeight(60),
      child: TextFormField(
        key: Key(fieldKey),
        controller: controller,
        //validator: (value) => onSubmit(value),
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: HexColor('0053CB'),
        ),
        maxLines: 1,
        cursorColor: HexColor('0053CB'),
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: HexColor('BBDEFB'),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor('E3F2FD'),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
          focusColor: Colors.yellow,
        ),
      ),
    );
  }
}
