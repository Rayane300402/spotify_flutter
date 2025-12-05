import 'package:flutter/material.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../core/configs/theme/palette.dart';

class BasicButton extends StatelessWidget {
  void Function()? onPressed;
  String title;
  final double? height;
  BasicButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      child: Text(
        title,
        style: TextStyle(
            color: context.isDarkMode ? Palette.grey : Palette.surfaceDark),
      ),
    );
  }
}
