import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/ui/components/bloc/favorite_cubit.dart';

import '../../core/configs/theme/palette.dart';

class FavoriteBtn extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteBtn({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final isFav = state.ids.contains(songEntity.songId);
          return IconButton(
            onPressed: () => context.read<FavoritesCubit>().toggle(songEntity.songId),
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_outline_outlined,
              size: 25,
              color: Palette.darkGrey,
            ),
          );
        },
    );
  }
}
