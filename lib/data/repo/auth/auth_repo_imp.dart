import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/data/sources/auth/auth_firebase.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';
import '../../../service_locator.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either> register(Registration registration) async {
    return await sL<AuthFirebase>().register(registration);
  }

  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }
}
