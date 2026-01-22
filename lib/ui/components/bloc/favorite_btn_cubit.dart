import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/usecases/songs/add_or_remove_fav.dart';
import 'package:spotify_futter/ui/components/bloc/favorite_btn_state.dart';
import 'package:spotify_futter/ui/components/favorite_btn.dart';

import '../../../service_locator.dart';

class FavoriteBtnCubit extends Cubit<FavoriteButtonState> {
  FavoriteBtnCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {

    var result = await sL<AddOrRemoveFavUseCase>().call(
        params: songId
    );
    result.fold(
          (l){
            emit(FavoriteButtonFailed());
          },
          (isFavorite){
        emit(
            FavoriteButtonUpdated(
                isFavorite: isFavorite
            )
        );
      },
    );
  }

}