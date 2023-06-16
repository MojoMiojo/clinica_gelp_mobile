// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GelpTextStyles {
  final TextStyle primaryTitles;
  final TextStyle primarySubtitle;
  final TextStyle primaryButton;
  final TextStyle secondaryButton;
  final TextStyle fieldName;
  final TextStyle hintTextField;

  const GelpTextStyles({
    required this.primaryTitles,
    required this.primarySubtitle,
    required this.primaryButton,
    required this.secondaryButton,
    required this.fieldName,
    required this.hintTextField,
  });

  static const kPrimaryTitle = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.black,
    height: 1.5,
  );

  static const kPrimarySubtitle = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.grey,
    height: 1.5,
  );

  static const kPrimaryButton = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.white,
  );


  static const kSecondaryButton = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  );

  static const kFieldName = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.black,
  );

  static const kHintTextField = TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.grey,
  );
}
