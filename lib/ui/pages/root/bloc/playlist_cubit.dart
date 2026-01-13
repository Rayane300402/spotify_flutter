import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/usecases/songs/get_playlist.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/pages/root/bloc/playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {

  PlaylistCubit(): super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var returnedSongs = await sL<GetPlaylistUseCase>().call();

    returnedSongs.fold((l) {
      emit(PlaylistLoadFail());
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
