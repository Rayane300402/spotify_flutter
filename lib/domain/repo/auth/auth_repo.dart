import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';

abstract class AuthRepo {
  Future<Either> register(Registration registration);
  Future<void> signin();
}
