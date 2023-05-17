// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpImageAppBarStyle {
  final Color appBarColor;
  final double elevation;
  final bool centerTitle;
  final EdgeInsets padding;

  const GelpImageAppBarStyle({
    this.appBarColor = Colors.white,
    this.elevation = 0,
    this.centerTitle = true,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  GelpImageAppBarStyle copyWith({
    Color? appBarColor,
    double? elevation,
    bool? centerTitle,
    EdgeInsets? padding,
  }) {
    return GelpImageAppBarStyle(
      appBarColor: appBarColor ?? this.appBarColor,
      elevation: elevation ?? this.elevation,
      centerTitle: centerTitle ?? this.centerTitle,
      padding: padding ?? this.padding,
    );
  }
}
