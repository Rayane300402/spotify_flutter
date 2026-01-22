import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/sources/songs/songs_db_service.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import 'package:spotify_futter/service_locator.dart';

class SongRepoImp extends SongsRepo{
  @override
  Future<Either> getSongs() async{
    return await sL<SongService>().getSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await sL<SongService>().getPlaylist();
  }

  @override
  Future<Either> addOrRemoveFav(String songId) async {
    return await sL<SongService>().addOrRemoveFav(songId);
  }

  @override
  Future<bool> isFav(String songId) async{
    return await sL<SongService>().isFav(songId);
  }

}