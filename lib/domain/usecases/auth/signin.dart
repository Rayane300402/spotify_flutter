import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/models/auth/signin.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../../repo/auth/auth_repo.dart';

class SignInUseCase implements UseCase<Either, SignInModel>{
  @override
  Future<Either> call({SignInModel ? params}) {
    return sL<AuthRepo>().signin(params!);
  }

}