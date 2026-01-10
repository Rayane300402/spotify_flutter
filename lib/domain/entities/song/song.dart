import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num length;
  final Timestamp date;

  SongEntity({required this.title, required this.artist, required this.length, required this.date});

}