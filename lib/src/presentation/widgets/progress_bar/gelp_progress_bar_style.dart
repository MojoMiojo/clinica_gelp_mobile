// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpProgressBarStyle {
  final Color progressColor;
  final Color backgroundColor;
  final double height;
  final double radius;
  final int duration;

  const GelpProgressBarStyle({
    this.progressColor = Colors.red,
    this.backgroundColor = Colors.grey,
    this.height = 10,
    this.radius = 8,
    this.duration = 350,
  });

  GelpProgressBarStyle copyWith({
    Color? progressColor,
    Color? backgroundColor,
    double? height,
    double? radius,
    int? duration,
  }) {
    return GelpProgressBarStyle(
      progressColor: progressColor ?? this.progressColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      height: height ?? this.height,
      radius: radius ?? this.radius,
      duration: duration ?? this.duration,
    );
  }
}
