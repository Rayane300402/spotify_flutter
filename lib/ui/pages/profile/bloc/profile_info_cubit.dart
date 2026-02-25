import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/usecases/auth/getUser.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/pages/profile/bloc/profile_info_state.dart';

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
    print('here');
print(userEntity.profileImg);
    emit(
      ProfileInfoLoaded(userEntity: userEntity)
    );
  });
  }

}