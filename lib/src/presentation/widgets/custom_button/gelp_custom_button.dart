// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets.dart';

class GelpCustomButton extends StatelessWidget {
  final String text;
  final GelpCustomButtonStyle style;
  final VoidCallback? onTap;

  const GelpCustomButton({
    Key? key,
    required this.text,
    this.onTap,
    this.style = const GelpCustomButtonStyle.primary(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.black,
        onTap: onTap,
        child: Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: style.buttonColor,
            borderRadius: BorderRadius.circular(
              style.borderRadius,
            ),
            border: Border.all(
              width: style.borderWidth,
              color: style.borderColor,
            ),
          ),
          child: Center(
            child: Padding(
              padding: style.padding,
              child: Text(
                text,
                style: style.textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
