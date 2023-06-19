// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets.dart';

class GelpRadiusField extends StatefulWidget {
  final String text;
  final int index;
  final bool isSelected;
  final Function(int) callback;
  final GelpRadiusFieldStyle style;

  const GelpRadiusField({
    Key? key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.callback,
    this.style = const GelpRadiusFieldStyle(),
  }) : super(key: key);

  @override
  State<GelpRadiusField> createState() => _GelpRadiusFieldState();
}

class _GelpRadiusFieldState extends State<GelpRadiusField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
        minHeight: widget.style.cardHeight ?? 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.style.radius),
        border: Border.all(
          color: widget.isSelected
              ? widget.style.selectedColor
              : widget.style.disabledBorderColor,
          width: 1,
        ),
      ),
      child: InkWell(
        splashColor: widget.style.selectedColor,
        onTap: () {
          widget.callback.call(widget.index);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: widget.style.radioSize,
                width: widget.style.radioSize,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? widget.style.selectedColor
                      : widget.style.disabledRadioColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: widget.isSelected
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
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.text,
                  style: widget.style.textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
