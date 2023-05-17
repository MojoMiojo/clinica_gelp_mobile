// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gelp_questionnaire/src/utils/utils.dart';

class GelpRadiusFieldStyle {
  final Color selectedColor;
  final Color disabledRadioColor;
  final Color disabledBorderColor;
  final Color pointerColor;
  final double cardHeight;
  final double radioSize;
  final TextStyle textStyle;

  const GelpRadiusFieldStyle({
    this.selectedColor = Colors.red,
    this.disabledRadioColor = Colors.grey,
    this.disabledBorderColor = Colors.black,
    this.pointerColor = Colors.white,
    this.cardHeight = 48,
    this.radioSize = 26,
    this.textStyle = GelpTextStyles.kSecondaryButton,
  });

  GelpRadiusFieldStyle copyWith({
    Color? selectedColor,
    Color? disabledRadioColor,
    Color? disabledBorderColor,
    Color? pointerColor,
    double? cardHeight,
    double? radioSize,
    TextStyle? textStyle,
  }) {
    return GelpRadiusFieldStyle(
      selectedColor: selectedColor ?? this.selectedColor,
      disabledRadioColor: disabledRadioColor ?? this.disabledRadioColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      pointerColor: pointerColor ?? this.pointerColor,
      cardHeight: cardHeight ?? this.cardHeight,
      radioSize: radioSize ?? this.radioSize,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
