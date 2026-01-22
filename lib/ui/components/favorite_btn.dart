import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/domain/entities/song/song.dart';
import 'package:spotify_futter/ui/components/bloc/favorite_btn_cubit.dart';
import 'package:spotify_futter/ui/components/bloc/favorite_btn_state.dart';

import '../../core/configs/theme/palette.dart';

class FavoriteBtn extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteBtn({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteBtnCubit(),
      child: BlocBuilder<FavoriteBtnCubit, FavoriteButtonState>(
          builder: (context, state) {
            if(state is FavoriteButtonInitial) {
              return IconButton(
                  onPressed: () async {
                    await context.read<FavoriteBtnCubit>().favoriteButtonUpdated(
                        songEntity.songId
                    );
                  },
                  icon: Icon(
                    songEntity.isFav ? Icons.favorite : Icons.favorite_outline_outlined,
                    size: 25,
                    color: Palette.darkGrey,
                  )
              );
            }

            if(state is FavoriteButtonUpdated) {
              return IconButton(
                  onPressed: () {
                    context.read<FavoriteBtnCubit>().favoriteButtonUpdated(
                        songEntity.songId
                    );
                  },
                  icon: Icon(
                    state.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                    size: 25,
                    color: Palette.darkGrey,
                  )
              );
            }

            if(state is FavoriteButtonFailed) {
              print('An error occurred');
              return Container();
            }

            return Container();

          },
      ),
    );
  }
}
