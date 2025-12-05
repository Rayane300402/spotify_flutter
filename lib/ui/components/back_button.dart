import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/utils/is_dark.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;

  const CustomAppBar(
      {super.key,
      this.title,
      this.hideBack = false,
      this.action,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      actions: [
        action ?? Container()
      ],
      leading: hideBack ? null : IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white.withValues(alpha: 0.03) : Colors.black.withValues(alpha:0.04),
              shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Palette.grey : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
