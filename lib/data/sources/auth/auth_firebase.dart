import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/data/models/auth/signin.dart';
import 'package:spotify_futter/data/models/auth/user.dart';
import '../../../domain/entities/auth/user.dart';

abstract class AuthFirebase{
  Future<Either> register(Registration registration);
  Future<Either> signin(SignInModel signin);
  Future<Either> getUser();
  Future<Either> updateProfileImage(File file);
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
  Future<Either> getUser() async{
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
          firebaseAuth.currentUser?.uid
      ).get();


      final data = user.data()!;
      UserData userData = UserData.fromJson(data);

      final authUrl = firebaseAuth.currentUser?.photoURL;
      final fsUrl = data['profileImg'] as String?;

      userData.profileImg = (fsUrl != null && fsUrl.trim().isNotEmpty)
          ? fsUrl
          : (authUrl != null && authUrl.trim().isNotEmpty)
          ? authUrl
          : 'https://cdn-icons-png.flaticon.com/512/10542/10542486.png';

      User userEntity = userData.toEntity();

      return Right(userEntity);
    } catch (e) {
      return Left('error in fetching user');
    }

  }

  @override
  Future<Either> updateProfileImage(File file) async{
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;
      final storage = FirebaseStorage.instance;

      final uid = auth.currentUser?.uid;

      if(uid == null) return Left('Not signed in');

      final ext = file.path.split('.').last;
      final ref = storage.ref().child('profile_images/$uid');

      await ref.putFile(file);

      final url = await ref.getDownloadURL();

      await auth.currentUser!.updatePhotoURL(url);

      await firestore.collection('Users').doc(uid).set(
        {'profileImg': url },
        SetOptions(merge:true)
      );

      return Right(url);

    } catch (e) {
        return Left('An error occurred while updating image ${e.toString()}');
    }
  }

}