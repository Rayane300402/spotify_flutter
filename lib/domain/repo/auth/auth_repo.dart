import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/data/models/auth/signin.dart';

abstract class AuthRepo {
  Future<Either> register(Registration registration);
  Future<Either> signin(SignInModel sign);
}
