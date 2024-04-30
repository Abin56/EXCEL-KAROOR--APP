// ignore_for_file: prefer_const_constructors

import 'package:excel_karror/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.textEditingController,
    this.function,
  });
  final TextEditingController? textEditingController;
 final String? hintText;
 final String? labelText;
 final String? Function(String? fieldContent)? function;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: function,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.h)),
          labelStyle: TextStyle(color: cblack, fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
          ),
          fillColor: cWhite,
          filled: true,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: cblack)),
    );
  }
}
