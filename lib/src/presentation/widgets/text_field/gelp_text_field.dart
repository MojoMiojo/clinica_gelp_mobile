import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';

class GelpTextField extends StatefulWidget {
  final String fieldName;
  final String? hintText;

  const GelpTextField({
    super.key,
    required this.fieldName,
    this.hintText,
  });

  @override
  State<GelpTextField> createState() => _GelpTextFieldState();
}

class _GelpTextFieldState extends State<GelpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: GelpTextStyles.kFieldName,
        ),
        const SizedBox(
          height: 6,
        ),
        TextField(
          decoration: InputDecoration(
            focusColor: Colors.black,
            hintText: widget.hintText,
            hintStyle: GelpTextStyles.kHintTextField,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
