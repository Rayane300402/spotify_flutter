
import '../../../../domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final User userEntity;
  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoUpdatingImage extends ProfileInfoState {}
class ProfileInfoUpdateImageFailure extends ProfileInfoState {
  final String message;
  ProfileInfoUpdateImageFailure(this.message);
}

class ProfileInfoFailure extends ProfileInfoState {}