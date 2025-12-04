import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';

import '../../../core/configs/assets/images.dart';
import '../../../core/configs/assets/vectors.dart';
import '../../components/button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(Vectors.logo),
                ),

                Spacer(),

                Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontSize: 18,
                    color: Palette.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30303c).withValues(alpha: 0.7),
                              ),
                              child: SvgPicture.asset(
                                Vectors.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        const Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Palette.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 35),
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30303c).withValues(alpha: 0.7),
                              ),
                              child: SvgPicture.asset(
                                Vectors.sun,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        const Text(
                          'Light Mode',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Palette.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),

                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ChooseModePage(),
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
    );
  }
}
