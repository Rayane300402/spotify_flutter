import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';

class SongModel {
   String? title;
   String? artist;
   num? length;
   Timestamp? date;

  SongModel({required this.title, required this.artist, required this.length, required this.date});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data["title"];
    artist = data["artist"];
    length = data["length"];
    date = data["date"];
  }

}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(title: title!, artist: artist!, length: length!, date: date!);
  }
}