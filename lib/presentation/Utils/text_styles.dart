// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpTextStyles {
  TextDecoration textDecoration;
  FontWeight fontWeight;
  double fontSize;
  Color color;

  GelpTextStyles({
    required this.textDecoration,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
  });

  TextStyle style() {
    return TextStyle(
      decoration: textDecoration,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}

GelpTextStyles primaryText = GelpTextStyles(
  textDecoration: TextDecoration.none,
  fontWeight: FontWeight.w400,
  fontSize: 20,
  color: Colors.black.withOpacity(0.9),
);
