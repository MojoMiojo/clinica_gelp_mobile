// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_colors.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_images.dart';

import '../widgets.dart';

class GelpImageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GelpImageAppBarStyle style;
  @override
  final Size preferredSize;
  final bool showPopButton;

  const GelpImageAppBar({
    Key? key,
    this.style = const GelpImageAppBarStyle(),
    this.showPopButton = false,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: style.appBarColor,
      elevation: style.elevation,
      centerTitle: style.centerTitle,
      leading: showPopButton
          ? InkWell(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: GelpColors.primary,
              ),
            )
          : null,
      title: Padding(
        padding: style.padding,
        child: Image.asset(
          GelpConstants.unaLogoPNG,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
