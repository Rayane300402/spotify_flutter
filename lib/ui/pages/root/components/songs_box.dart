import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/assets/images.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/utils/cover_url.dart';
import 'package:spotify_futter/utils/is_dark.dart';


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
            onTap: () {},
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
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 40,
                              width: 40,
                              transform: Matrix4.translationValues(10, 10, 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.isDarkMode ? Palette.darkGrey : Color(0xFF555555)
                              ),
                              child:context.isDarkMode ? Image.asset(Images.play) :Image.asset(Images.playDark),
                            ),
                          ),
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
