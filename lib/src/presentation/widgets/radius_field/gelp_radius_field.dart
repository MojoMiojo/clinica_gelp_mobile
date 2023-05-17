// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gelp_questionnaire/presentation/widgets/radius_field/radius_field.dart';

class GelpRadiusField extends StatefulWidget {
  final String text;
  final int index;
  final Function(int) callback;
  final GelpRadiusFieldStyle style;

  const GelpRadiusField({
    Key? key,
    required this.text,
    required this.index,
    required this.callback,
    this.style = const GelpRadiusFieldStyle(),
  }) : super(key: key);

  @override
  State<GelpRadiusField> createState() => _GelpRadiusFieldState();
}

class _GelpRadiusFieldState extends State<GelpRadiusField> {
  late bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.style.cardHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected
              ? widget.style.selectedColor
              : widget.style.disabledBorderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                widget.callback.call(widget.index);
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                height: widget.style.radioSize,
                width: widget.style.radioSize,
                decoration: BoxDecoration(
                  color: selected
                      ? widget.style.selectedColor
                      : widget.style.disabledRadioColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: selected
                    ? Center(
                        child: Container(
                          height: widget.style.radioSize / 2,
                          width: widget.style.radioSize / 2,
                          decoration: BoxDecoration(
                            color: widget.style.pointerColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              widget.text,
              style: widget.style.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
