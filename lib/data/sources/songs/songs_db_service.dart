import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_futter/data/models/song/song.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';

abstract class SongService {
  Future<Either> getSongs();
}

class SongServiceImp extends SongService {

  @override
  Future<Either> getSongs() async{

    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection("songs").orderBy('date', descending: true).limit(3).get();

      for (var e in data.docs) {
        var songModel = SongModel.fromJson(e.data());
        //e.data()  returns data of doc, and is in json format, that's where we use the song model

        // convert to entity
        songs.add(songModel.toEntity());
      }

      return Right(songs);

    } catch (e) {
      return Left('An error occurred while fetching the songs. Please try again.');
    }
    
  }

}