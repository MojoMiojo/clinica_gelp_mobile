// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpTextStyles {
  final TextStyle primaryTitles;
  final TextStyle primarySubtitle;
  final TextStyle primaryButton;
  final TextStyle secondaryButton;

  const GelpTextStyles({
    required this.primaryTitles,
    required this.primarySubtitle,
    required this.primaryButton,
    required this.secondaryButton,
  });

  static const kPrimaryTitle = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.black,
  );

  static const kPrimarySubtitle = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.grey,
  );

  static const kPrimaryButton = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white,
  );

  static const kSecondaryButton = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );
}
