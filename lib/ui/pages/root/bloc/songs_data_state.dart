import 'package:spotify_futter/domain/entities/song/song.dart';

abstract class SongsDataState {}

class SongsDataLoading extends SongsDataState {}

class SongsDataLoaded extends SongsDataState {
  final List<SongEntity> songs;
  SongsDataLoaded({required this.songs});
}

class SongDataLoadFail extends SongsDataState {}