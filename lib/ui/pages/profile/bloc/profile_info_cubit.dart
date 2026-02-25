import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/usecases/auth/getUser.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/pages/profile/bloc/profile_info_state.dart';

import '../../../../domain/usecases/auth/updateProfileImg.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState>{
  ProfileInfoCubit(): super(ProfileInfoLoading());

  Future<void> getUser() async {
  var user = await sL<GetUserUseCase>().call();

  user.fold((l) {
    // 'error in fetching user'
    emit(
      ProfileInfoFailure()
    );
  }, (userEntity) {
    emit(
      ProfileInfoLoaded(userEntity: userEntity)
    );
  });
  }

  Future<void> updateProfileImage(File file) async {
    // keep current data to re-emit later
    final current = state;
    emit(ProfileInfoUpdatingImage());

    final res = await sL<UpdateProfileImageUseCase>().call(params: file);

    res.fold(
          (err) {
        // restore previous UI + show failure state if you want
        if (current is ProfileInfoLoaded) emit(current);
        emit(ProfileInfoUpdateImageFailure(err.toString()));
      },
          (_) async {
        // reload updated user
        await getUser();
      },
    );
  }

}