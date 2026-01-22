import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_futter/data/models/song/song.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/service_locator.dart';

import '../../../domain/usecases/songs/is_fav.dart';

abstract class SongService {
  Future<Either> getSongs();
  Future<Either> getPlaylist();
  Future<Either> addOrRemoveFav(String songId);
  Future<bool> isFav(String songId);
}

class SongServiceImp extends SongService {
  @override
  Future<Either> getSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy('date', descending: true)
          .limit(3)
          .get();

      for (var e in data.docs) {
        var songModel = SongModel.fromJson(e.data());
        //e.data()  returns data of doc, and is in json format, that's where we use the song model
        bool isFav = await sL<IsFavUseCase>().call(
          params: e.reference.id
        );
        songModel.isFav = isFav;
        songModel.songId = e.reference.id;
        // convert to entity
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left(
          'An error occurred while fetching the songs. Please try again.');
    }
  }

  @override
  Future<Either> getPlaylist() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy('date', descending: true)
          .get();

      for (var e in data.docs) {
        var songModel = SongModel.fromJson(e.data());
        //e.data()  returns data of doc, and is in json format, that's where we use the song model
        bool isFav = await sL<IsFavUseCase>().call(
            params: e.reference.id
        );
        songModel.isFav = isFav;
        songModel.songId = e.reference.id;
        // convert to entity
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left(
          'An error occurred while fetching the songs. Please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFav(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      if (user != null) {
        String uId = user.uid;

        QuerySnapshot fav = await firebaseFirestore
            .collection('Users')
            .doc(uId)
            .collection('Favorites')
            .where('songId', isEqualTo: songId)
            .get();

        if (fav.docs.isNotEmpty) {
          // remove from collection
          await fav.docs.first.reference.delete();
          return Right(false);
        } else {
          // add to collection
          await firebaseFirestore.collection('Users').doc(uId).collection('Favorites').add({
            'songId' : songId,
            'addedDate' : Timestamp.now()
          });
          return Right(true);
        }
      }

      return Left('User does not exist');

    } catch (e) {
      return Left(
          'An error occurred while add/removing song. Please try again.');
    }
  }

  @override
  Future<bool> isFav(String songId) async{
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      if (user != null) {
        String uId = user.uid;

        QuerySnapshot fav = await firebaseFirestore
            .collection('Users')
            .doc(uId)
            .collection('Favorites')
            .where('songId', isEqualTo: songId)
            .get();

        if (fav.docs.isNotEmpty) {
          // means it's in fav
          return true;
        } else {
          // it's not in fav
          return false;
        }
      }

      return false;

    } catch (e) {
      return false;
    };
  }
}
