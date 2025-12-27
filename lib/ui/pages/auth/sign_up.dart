import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/domain/usecases/auth/register.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/components/input_field.dart';
import 'package:spotify_futter/ui/pages/auth/sign_in.dart';
import 'package:spotify_futter/ui/pages/root/home.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../core/configs/assets/vectors.dart';
import '../../../core/configs/theme/palette.dart';
import '../../../utils/url_launcher.dart';
import '../../components/back_button.dart';
import '../../components/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        resizeToAvoidBottomInset: false, // to avoid resizing when a keyboard pops up
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
                          'Register',
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
                                text: 'If You Need Support ',
                              ),
                              TextSpan(
                                  text: 'Click Here',
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
                        InputField(
                            controller: _fullName, hintText: 'Full Name'),
                        SizedBox(height: 20),
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
                        CustomButton(
                          onPressed: () async {
                            var result = await sL<RegisterUseCase>().call(
                                params: Registration(
                                    fullName: _fullName.text,
                                    email: _email.text,
                                    password: _password.text));
                            result.fold((l) {
                              var snackBar = SnackBar(content: Text(l));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }, (r) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()),
                                  (route) => false);
                            });
                          },
                          title: 'Register Account',
                          height: 80,
                        ),
                        SizedBox(height: 50),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffa5a3a3),
                                    fontWeight: FontWeight.w600),
                                children: [
                              TextSpan(
                                text: 'Already A Member? ',
                              ),
                              TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(color: Color(0xff288CE9)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignIn(),
                                        ),
                                      );
                                    }),
                            ])),
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
