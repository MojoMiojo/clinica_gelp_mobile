// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gelp_questionnaire/presentation/widgets/widgets.dart';

class GelpImageAppBar extends StatelessWidget with PreferredSizeWidget {
  final String imagePath;
  final GelpImageAppBarStyle style;
  @override
  final Size preferredSize;

  const GelpImageAppBar({
    Key? key,
    this.imagePath = "assets/images/una_logo.png",
    this.style = const GelpImageAppBarStyle(),
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: style.appBarColor,
      elevation: style.elevation,
      centerTitle: style.centerTitle,
      title: Padding(
        padding: style.padding,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
