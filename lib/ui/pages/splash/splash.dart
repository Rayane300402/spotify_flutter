import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_futter/core/configs/assets/vectors.dart';
import 'package:spotify_futter/ui/pages/introduction/introduction.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Introduction()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            Vectors.logo,
          ),
        ),
      ),
    );
  }
}
