// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/utils/text_styles.dart';

class GelpCustomButtonStyle {
  final Color buttonColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const GelpCustomButtonStyle({
    this.buttonColor = Colors.red,
    this.borderColor = Colors.transparent,
    this.borderRadius = 8,
    this.borderWidth = 0,
    this.padding = const EdgeInsets.all(8),
    this.textStyle,
  });

  const GelpCustomButtonStyle.primary({
    this.buttonColor = Colors.red,
    this.borderColor = Colors.transparent,
    this.borderRadius = 8,
    this.borderWidth = 0,
    this.padding = const EdgeInsets.all(8),
    this.textStyle = GelpTextStyles.kPrimaryButton,
  });

  const GelpCustomButtonStyle.secondary({
    this.buttonColor = Colors.white,
    this.borderColor = Colors.red,
    this.borderRadius = 8,
    this.borderWidth = 2,
    this.padding = const EdgeInsets.all(8),
    this.textStyle = GelpTextStyles.kSecondaryButton,
  });
}
