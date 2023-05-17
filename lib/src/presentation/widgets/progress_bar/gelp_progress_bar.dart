// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets.dart';

class GelpProgressBar extends StatefulWidget {
  final double percentage;
  final GelpProgressBarStyle style;

  const GelpProgressBar({
    Key? key,
    this.percentage = 0,
    this.style = const GelpProgressBarStyle(),
  }) : super(key: key);

  @override
  State<GelpProgressBar> createState() => _GelpProgressBarState();
}

class _GelpProgressBarState extends State<GelpProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: widget.style.height,
                decoration: BoxDecoration(
                  color: widget.style.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    widget.style.radius,
                  ),
                ),
              ),
              Row(
                children: [
                  AnimatedContainer(
                    key: const Key("gelp_animated_progress_bar"),
                    duration: Duration(
                      milliseconds: widget.style.duration,
                    ),
                    height: widget.style.height,
                    width: constraints.maxWidth * widget.percentage,
                    decoration: BoxDecoration(
                      color: widget.style.progressColor,
                      borderRadius: BorderRadius.circular(
                        widget.style.radius,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
