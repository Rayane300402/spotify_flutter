import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/ui/components/logo.dart';
import 'package:spotify_futter/ui/pages/auth/signup_or_signin.dart';
import 'package:spotify_futter/ui/pages/choose_mode/bloc.dart';

import '../../../core/configs/assets/images.dart';
import '../../../core/configs/assets/vectors.dart';
import '../../components/button.dart';
import '../../components/mode_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.chooseModeBG),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(color: Colors.black.withValues(alpha: 0.25)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  Logo(),
                  Spacer(),
                  Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontSize: 26,
                      color: Palette.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ModeButton(
                        icon: Vectors.moon,
                        label: 'Dark Mode',
                        isSelected:
                            context.watch<ModeCubit>().state == ThemeMode.dark,
                        onTap: () =>
                            context.read<ModeCubit>().switchMode(ThemeMode.dark),
                      ),
                      const SizedBox(width: 35),
                      ModeButton(
                        icon: Vectors.sun,
                        label: 'Light Mode',
                        isSelected:
                            context.watch<ModeCubit>().state == ThemeMode.light,
                        onTap: () =>
                            context.read<ModeCubit>().switchMode(ThemeMode.light),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignupOrSignin(),
                        ),
                      );
                    },
                    title: 'Continue',
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
