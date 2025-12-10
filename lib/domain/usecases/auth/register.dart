import 'package:dartz/dartz.dart';
import 'package:spotify_futter/core/usecases/usecase.dart';
import 'package:spotify_futter/data/models/auth/registration.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';

import '../../../service_locator.dart';

class RegisterUseCase implements UseCase<Either, Registration>{
  @override
  Future<Either> call({Registration ? params}) {
    return sL<AuthRepo>().register(params!);
  }

}