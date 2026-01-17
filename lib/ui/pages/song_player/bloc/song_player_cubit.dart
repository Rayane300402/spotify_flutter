import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/ui/pages/song_player/bloc/song_player_state.dart';

import '../../../../utils/cover_song_url.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit(): super(SongPlayerLoading());

  Future<void> loadSong(SongEntity song) async {
    try {
      final url = await getSongUrl(song);

      await audioPlayer.setUrl(url);

      songDuration = audioPlayer.duration ?? Duration.zero;

      audioPlayer.positionStream.listen((position) {
        songPosition = position;
        emit(SongPlayerLoaded());
      });

      emit(
        SongPlayerLoaded()
      );
    } catch(e) {
      print('error loading song $e');
      emit(
          SongPlayerFailure()
      );
    }
  }

  void playOrPause()  {
    if(audioPlayer.playing == true) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }

    emit(
      SongPlayerLoaded()
    );
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }

}