import 'package:flutter/material.dart';
import 'package:spotify_futter/ui/components/favorite_btn.dart';
import 'package:spotify_futter/ui/components/start_btn.dart';
import 'package:spotify_futter/ui/pages/song_player/song_player.dart';

import '../../../../../domain/entities/song/song.dart';

class PlayList extends StatelessWidget {
  final List<SongEntity> songs;
  const PlayList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => SongPlayer(song: songs[index]),));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: StartBtn(
                        onTap: () {},
                        height: 45,
                        width: 45,
                        isNews: false,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          songs[index].artist,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(songs[index].length.toString().replaceAll('.', ":")),
                    const SizedBox(
                      width: 20,
                    ),
                    FavoriteBtn()
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
        itemCount: songs.length);
  }
}
