import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_futter/ui/pages/root/bloc/songs_data_cubit.dart';
import 'package:spotify_futter/ui/pages/root/bloc/songs_data_state.dart';
import 'package:spotify_futter/ui/pages/root/components/songs_box.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SongsDataCubit()..getSongsData(),
      child: SizedBox(
          height:200,
        child: BlocBuilder<SongsDataCubit, SongsDataState>(
          builder: (context, state) {
            if(state is SongsDataLoading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }

            if(state is SongsDataLoaded) {
              return SongsBox(songs: state.songs,);
            }

            return Container();
          },
        )
      ),
    );
  }
}
