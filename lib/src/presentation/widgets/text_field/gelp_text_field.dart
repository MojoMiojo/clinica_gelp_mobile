import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_text_styles.dart';

class GelpTextField extends StatefulWidget {
  final Key formKey;
  final String fieldName;
  final String? hintText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const GelpTextField({
    super.key,
    required this.formKey,
    required this.fieldName,
    this.hintText,
    required this.onChanged,
    this.validator,
  });

  @override
  State<GelpTextField> createState() => _GelpTextFieldState();
}

class _GelpTextFieldState extends State<GelpTextField> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName,
            style: GelpTextStyles.kFieldName,
          ),
          const SizedBox(height: 6),
          TextFormField(
            validator: widget.validator,
            controller: _textEditingController,
            onChanged: (value) => widget.onChanged(value),
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
      ),
    );
  }
}
