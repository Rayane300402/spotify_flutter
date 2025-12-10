import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';

abstract class AuthFirebase{
  Future<Either> register(Registration registration);
  Future<void> signin();
}

class AuthFirebaseService extends AuthFirebase {
  @override
  Future<Either> register(Registration registration) async{
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: registration.email,
            password: registration.password
        );

        return Right('Registration success');
    } on FirebaseAuthException catch (e) {
        debugPrintThrottled("Error: $e");
        String message = '';

        if(e.code == 'weak-password') {
          message = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          message = 'An account already exists with that email.';
        }


        return Left(message);
    }
  }

  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

}