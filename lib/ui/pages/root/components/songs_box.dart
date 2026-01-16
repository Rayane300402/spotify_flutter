import 'package:flutter/material.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/ui/components/start_btn.dart';
import 'package:spotify_futter/utils/cover_song_url.dart';

import '../../song_player/song_player.dart';

class SongsBox extends StatelessWidget {
  final List<SongEntity> songs;
  const SongsBox({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 50, right: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SongPlayer(song: songs[index],),));
            },
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: FutureBuilder(
                    future: getCoverUrl(songs[index]),
                    builder: (context, snapshot) {
                      final hasUrl = snapshot.connectionState == ConnectionState.done && snapshot.hasData && !snapshot.hasError;
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage(hasUrl ? snapshot.data! : "https://placehold.co/300x300.png"),
                          fit: BoxFit.cover)
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child:StartBtn(onTap: (){}, height: 40, width: 40, isNews: true,)
                        ),
                      );
                    },
                  )),
                  SizedBox(height: 10,),
                  Text(
                    songs[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                  ) ,
                  const SizedBox(height: 5,),
                  Text(
                    songs[index].artist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
        itemCount: songs.length);
  }
}
