// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/presentation/widgets/widgets.dart';

class GelpCustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final GelpCustomButtonStyle style;

  const GelpCustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.style = const GelpCustomButtonStyle.primary(),
  }) : super(key: key);

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
            color: style.buttonColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                style.borderRadius,
              ),
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
