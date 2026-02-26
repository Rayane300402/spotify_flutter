import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_futter/core/configs/assets/vectors.dart';
import 'package:spotify_futter/ui/pages/introduction/introduction.dart';

import '../auth/signup_or_signin.dart';
import '../choose_mode/bloc.dart';
import '../root/home.dart';

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
    if(!mounted) return;

    // Wait for Firebase to restore auth session (prevents "false null" on cold start)
    await FirebaseAuth.instance.authStateChanges().first;

    final user = FirebaseAuth.instance.currentUser;
    final modeCubit = context.read<ModeCubit>();
    late final Widget next;

    if (user != null) {
      next = const HomePage(); // already logged in -> skip everything
    } else if (!modeCubit.hasChosenMode) {
      // not logged in, and never chose theme -> intro (or directly ChooseMode if you prefer)
      next = const Introduction();
    } else {
      // not logged in, but theme already chosen -> go straight to auth
      next = const SignupOrSignin();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => next),
    );
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
