import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/auth/signup_or_signin.dart';
import '../pages/root/home.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        // waiting for the first auth state result
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snap.data;

        // not logged in -> go to auth flow
        if (user == null) {
          return const SignupOrSignin();
        }

        // logged in -> go to app
        return const HomePage();
      },
    );
  }
}