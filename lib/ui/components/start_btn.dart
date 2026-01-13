import 'package:flutter/material.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../core/configs/assets/images.dart';
import '../../core/configs/theme/palette.dart';

class StartBtn extends StatelessWidget {
  void Function()? onTap;
  double? height;
  double? width;
  final bool isNews;

  StartBtn({super.key, required this.onTap, required this.height, required this.width, required this.isNews});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        transform: isNews ? Matrix4.translationValues(10, 10, 0) : Matrix4.translationValues(0, 0, 0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? Color(0xff2C2C2C) : Color(0xFFE6E6E6)
        ),
        child:context.isDarkMode ? Image.asset(Images.play) :Image.asset(Images.playDark),
      ),
    );
  }
}
