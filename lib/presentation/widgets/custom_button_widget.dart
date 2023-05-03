// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.padding = 8,
    this.borderWidth = 1,
    this.borderRadius = 8,
    this.buttonColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.textStyle,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final double padding;
  final double borderWidth;
  final double borderRadius;
  final Color buttonColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.black,
        onTap: onTap(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
