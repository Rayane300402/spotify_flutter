import 'package:firebase_storage/firebase_storage.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';

Future<String> getCoverUrl(SongEntity song) async {
  final ref = FirebaseStorage.instance.ref().child('covers/${song.artist} - ${song.title}.jpg');
  return await ref.getDownloadURL();
}

Future<String> getSongUrl (SongEntity song) async {
  final ref = FirebaseStorage.instance.ref().child('songs/${song.artist} - ${song.title}.mp3');
  return await ref.getDownloadURL();
}