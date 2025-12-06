import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/utils/is_dark.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextColor =
    context.isDarkMode ? Palette.grey : Palette.surfaceDark;

    return SizedBox(
        height: 80,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscure : false,
        style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600),
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              setState(() => _obscure = !_obscure);
            },
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xff797979),
            ),
          )
              : null,
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
