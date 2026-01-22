import 'package:dartz/dartz.dart';

abstract class SongsRepo {
  Future<Either> getSongs();
  Future<Either> getPlaylist();
  Future<Either> addOrRemoveFav(String songId);
  Future<bool> isFav(String songId);
}