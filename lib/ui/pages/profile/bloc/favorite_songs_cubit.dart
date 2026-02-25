import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/service_locator.dart';

import '../../../../domain/entities/song/song.dart';
import '../../../../domain/usecases/songs/get_favorite_use_case.dart';
import 'favorite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());


  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {

    var result  = await sL<GetFavoriteSongsUseCase>().call();

    result.fold(
            (l){
          emit(
              FavoriteSongsFailure()
          );
        },
            (r){
          favoriteSongs = r;
          emit(
              FavoriteSongsLoaded(favoriteSongs: favoriteSongs)
          );
        }
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(
        FavoriteSongsLoaded(favoriteSongs: favoriteSongs)
    );
  }

}