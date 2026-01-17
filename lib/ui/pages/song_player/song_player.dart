import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/ui/components/back_button.dart';
import 'package:spotify_futter/ui/pages/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_futter/ui/pages/song_player/bloc/song_player_state.dart';
import 'package:spotify_futter/utils/is_dark.dart';
import '../../../core/configs/theme/palette.dart';
import '../../../utils/common.dart';
import '../../../utils/cover_song_url.dart';
import '../../components/favorite_btn.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity song;
  const SongPlayer({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomAppBar(
            title: Text(
              'Now Playing',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            action: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 35,
                  color: context.isDarkMode ? Palette.grey : Colors.black,
                )),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: BlocProvider(
          create: (_) => SongPlayerCubit()..loadSong(song),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    child: FutureBuilder(
                      future: getCoverUrl(song),
                      builder: (context, snapshot) {
                        final hasUrl =
                            snapshot.connectionState == ConnectionState.done &&
                                snapshot.hasData &&
                                !snapshot.hasError;
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(hasUrl
                                      ? snapshot.data!
                                      : "https://placehold.co/300x300.png"),
                                  fit: BoxFit.fitHeight)),
                        );
                      },
                    )),

                SizedBox(
                  height: 20,
                ),

                // Song Data
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          song.artist,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    FavoriteBtn()
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                //AudioPlayer Design

                BlocBuilder<SongPlayerCubit, SongPlayerState>(
                  builder: (context, state) {
                    if (state is SongPlayerLoading) {
                      return CircularProgressIndicator();
                    }

                    if (state is SongPlayerLoaded) {
                      return Column(children: [
                        Slider(
                            value: context
                                .read<SongPlayerCubit>()
                                .songPosition
                                .inSeconds
                                .toDouble(),
                            min: 0.0,
                            max: context
                                .read<SongPlayerCubit>()
                                .songDuration
                                .inSeconds
                                .toDouble(),
                            onChanged: (value) {}),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatDuration(
                                context.read<SongPlayerCubit>().songPosition)),
                            Text(formatDuration(
                                context.read<SongPlayerCubit>().songDuration))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<SongPlayerCubit>().playOrPause();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Palette.primary),
                            child: Icon(context
                                    .read<SongPlayerCubit>()
                                    .audioPlayer
                                    .playing
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        )
                      ]);
                    }

                    return Text(
                      'An Error Occurred',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: context.isDarkMode
                              ? Color(0xffC6C6C6)
                              : Color(0xff131313)),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}