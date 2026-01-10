import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/usecases/songs/get_songs.dart';
import 'package:spotify_futter/service_locator.dart';
import 'package:spotify_futter/ui/pages/root/bloc/songs_data_state.dart';

class SongsDataCubit extends Cubit<SongsDataState> {

  SongsDataCubit(): super(SongsDataLoading());

  Future<void> getSongsData() async {
    var returnedSongs = await sL<GetSongsUseCase>().call();

    returnedSongs.fold((l) {
      emit(SongDataLoadFail());
    }, (data) {
      emit(SongsDataLoaded(songs: data));
    });
  }
}
