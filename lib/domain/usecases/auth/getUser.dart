import 'package:dartz/dartz.dart';
import 'package:spotify_futter/core/usecases/usecase.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';

import '../../../service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) {
    return sL<AuthRepo>().getUser();
  }

}