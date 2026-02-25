import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/data/models/auth/signin.dart';
import 'package:spotify_futter/data/models/auth/user.dart';
import '../../../domain/entities/auth/user.dart';

abstract class AuthFirebase{
  Future<Either> register(Registration registration);
  Future<Either> signin(SignInModel signin);
  Future<Either> getUser();
}

class AuthFirebaseService extends AuthFirebase {
  @override
  Future<Either> register(Registration registration) async{
    try {
        var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: registration.email,
            password: registration.password
        );

        FirebaseFirestore.instance.collection('Users').doc(data.user?.uid)
            .set(
          {
            'name': registration.fullName,
            'email': data.user?.email
          }
        );

        return Right('Registration success');
    } on FirebaseAuthException catch (e) {
        debugPrintThrottled("Error: $e");
        String message = '';

        if(e.code == 'weak-password') {
          message = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          message = 'An account already exists with that email.';
        } else {
          message = e.code;
        }

        return Left(message);
    }
  }

  @override
  Future<Either> signin(SignInModel signin) async{
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signin.email,
          password: signin.password
      );

      return Right('Logged In');
    } on FirebaseAuthException catch (e) {
      debugPrintThrottled("Error: $e");
      String message = '';

      if(e.code == 'invalid-email') {
        message = 'No user was found with that email';
      } else if (e.code == 'invalid-credentials') {
        message = 'Wrong password provided for that user';
      } else {
        message = e.code;
      }

      return Left(message);
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getUser() async{

    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
          firebaseAuth.currentUser?.uid
      ).get();

      UserData userData = UserData.fromJson(user.data() !);
print('image ${firebaseAuth.currentUser?.photoURL}');
      userData.profileImg = firebaseAuth.currentUser?.photoURL ?? 'https://cdn-icons-png.flaticon.com/512/10542/10542486.png';

      print('userData : ${userData.profileImg}');

      User userEntity = userData.toEntity();

      return Right(userEntity);
    } catch (e) {
      return Left('error in fetching user');
    }

  }

}