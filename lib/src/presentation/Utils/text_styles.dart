// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpTextStyles {
  TextDecoration textDecoration;
  FontWeight fontWeight;
  String fontFamily;
  double fontSize;
  Color color;

  GelpTextStyles({
    required this.textDecoration,
    required this.fontWeight,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
  });

  TextStyle style() {
    return TextStyle(
      fontFamily: fontFamily,
      decoration: textDecoration,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle customColored(Color color) {
    return TextStyle(
      fontFamily: fontFamily,
      decoration: textDecoration,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}

GelpTextStyles primaryTitle = GelpTextStyles(
  fontFamily: 'Roboto',
  textDecoration: TextDecoration.none,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  color: Colors.black.withOpacity(0.9),
);

GelpTextStyles primarySubtitle = GelpTextStyles(
  fontFamily: 'Roboto',
  textDecoration: TextDecoration.none,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Colors.grey.withOpacity(0.9),
);

GelpTextStyles primaryButton = GelpTextStyles(
  fontFamily: 'Roboto',
  textDecoration: TextDecoration.none,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Colors.white,
);
