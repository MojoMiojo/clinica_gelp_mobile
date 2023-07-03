import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isConfirmed;
  final Text text;
  final Function(bool?)? onTap;

  const CheckBoxWidget({
    super.key,
    required this.isConfirmed,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isConfirmed,
          onChanged: onTap,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: MaterialStateColor.resolveWith((_) {
            return GelpColors.primary;
          }),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: text,
        )
      ],
    );
  }
}
