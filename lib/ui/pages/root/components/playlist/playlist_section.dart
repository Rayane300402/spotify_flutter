import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/ui/pages/root/bloc/playlist_cubit.dart';
import 'package:spotify_futter/ui/pages/root/bloc/playlist_state.dart';
import 'package:spotify_futter/ui/pages/root/components/playlist/play_list.dart';
import 'package:spotify_futter/ui/pages/root/components/playlist/playlist_header.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../../../../core/configs/theme/palette.dart';

class PlaylistSection extends StatelessWidget {
  const PlaylistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlaylist(),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoading) {
            return Column(
              children: [
                PlaylistHeader(isEmpty: true),
                Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }

          if (state is PlaylistLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  PlaylistHeader(isEmpty: false),
                  SizedBox(
                    height: 20,
                  ),
                  PlayList(
                    songs: state.songs,
                  )
                ],
              ),
            );
          }

          return Column(
            children: [
              PlaylistHeader(isEmpty: true),
              Center(
                child: Text(
                  'No Songs Yet',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: context.isDarkMode
                          ? Color(0xffC6C6C6)
                          : Color(0xff131313)),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
