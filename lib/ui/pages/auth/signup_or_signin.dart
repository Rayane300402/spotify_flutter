import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/core/configs/assets/images.dart';
import 'package:spotify_futter/ui/components/basic_button.dart';
import 'package:spotify_futter/ui/pages/auth/sign_in.dart';
import 'package:spotify_futter/ui/pages/auth/sign_up.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../components/back_button.dart';
import '../../components/button.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = context.isDarkMode ? Palette.grey : Palette.surfaceDark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomAppBar(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(Vectors.topPattern),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(Vectors.bottomPattern),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(Images.authBG),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Vectors.logo),
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      'Enjoy Listening to Music',
                      style: TextStyle(
                        fontSize: 26,
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 21),
                    Text(
                      'Spotify is a leading global audio streaming service. Offering songs, podcasts and audiobooks.',
                      style: TextStyle(fontSize: 17, color: Color(0xff797979)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUp(),
                                ),
                              );
                            },
                            title: 'Register',
                            height: 73,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: BasicButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignIn(),
                              ),
                            );
                          }, title: 'Sign In', height: 73,)

                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
