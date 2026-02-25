import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/repo/auth/auth_repo.dart';
import '../../../service_locator.dart';

class UpdateProfileImageUseCase implements UseCase<Either, File> {
  @override
  Future<Either> call({File? params}) {
    return sL<AuthRepo>().updateProfileImage(params!);
  }
}