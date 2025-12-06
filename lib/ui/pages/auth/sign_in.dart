import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../../utils/url_launcher.dart';
import '../../components/back_button.dart';
import '../../components/button.dart';
import '../../components/input_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextColor =
    context.isDarkMode ? Palette.grey : Palette.surfaceDark;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus(); // now safe: won't clear text
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomAppBar(
                  title: SvgPicture.asset(
                    Vectors.logo,
                    height: 40,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 21),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff797979)),
                                children: [
                                  TextSpan(
                                    text: 'If you need support ',
                                  ),
                                  TextSpan(
                                      text: 'Click here',
                                      style: TextStyle(color: Color(0xff38B432)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          const url =
                                              'https://support.spotify.com/';

                                          try {
                                            launchURL(url);
                                          } catch (e) {
                                            debugPrint('Error launching $url: $e');
                                          }
                                        }),
                                ])),
                        SizedBox(height: 50),
                        InputField(controller: _email, hintText: 'Email'),
                        SizedBox(height: 20),
                        InputField(
                          controller: _password,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                  'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xffAEAEAE),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {
                            print(_fullName.text.toString());
                          },
                          title: 'Sign In',
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
