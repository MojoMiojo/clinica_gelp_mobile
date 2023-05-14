import 'package:flutter/material.dart';

class ImageAppBar extends StatelessWidget with PreferredSizeWidget {
  const ImageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Image.asset(
          "assets/images/una_logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
