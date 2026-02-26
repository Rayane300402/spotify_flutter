import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/utils/is_dark.dart';

import '../../core/configs/assets/images.dart';
import '../../core/configs/theme/palette.dart';
import '../pages/song_player/song_player.dart';
import 'bloc/favorite_cubit.dart';

class StartBtn extends StatelessWidget {
  SongEntity song;
  double? height;
  double? width;
  final bool isNews;

  StartBtn({super.key, required this.song, required this.height, required this.width, required this.isNews});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<FavoritesCubit>(),
                child: SongPlayer(song: song),
              ),
            ));
      },
      child: Container(
        height: height,
        width: width,
        transform: isNews ? Matrix4.translationValues(10, 10, 0) : Matrix4.translationValues(0, 0, 0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? Color(0xff2C2C2C) : Color(0xFFE6E6E6)
        ),
        child:context.isDarkMode ? Image.asset(Images.play) :Image.asset(Images.playDark),
      ),
    );
  }
}
