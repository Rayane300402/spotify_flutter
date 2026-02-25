import 'package:get_it/get_it.dart';
import 'package:spotify_futter/data/repo/auth/auth_repo_imp.dart';
import 'package:spotify_futter/data/repo/song/song_repo.dart';
import 'package:spotify_futter/data/sources/auth/auth_firebase.dart';
import 'package:spotify_futter/data/sources/songs/songs_db_service.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import 'package:spotify_futter/domain/usecases/auth/getUser.dart';
import 'package:spotify_futter/domain/usecases/auth/register.dart';
import 'package:spotify_futter/domain/usecases/auth/signin.dart';
import 'package:spotify_futter/domain/usecases/songs/get_playlist.dart';
import 'package:spotify_futter/domain/usecases/songs/get_songs.dart';
import 'package:spotify_futter/domain/usecases/songs/is_fav.dart';

import 'domain/usecases/auth/updateProfileImg.dart';
import 'domain/usecases/songs/add_or_remove_fav.dart'
    show AddOrRemoveFavUseCase;

final sL = GetIt.instance;

Future<void> initDep() async {
  sL.registerSingleton<AuthFirebase>(AuthFirebaseService());

  sL.registerSingleton<SongService>(SongServiceImp());

  sL.registerSingleton<AuthRepo>(AuthRepoImp());

  sL.registerSingleton<SongsRepo>(SongRepoImp());

  sL.registerSingleton<RegisterUseCase>(RegisterUseCase());

  sL.registerSingleton<SignInUseCase>(SignInUseCase());

  sL.registerSingleton<GetSongsUseCase>(GetSongsUseCase());

  sL.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());

  sL.registerSingleton<AddOrRemoveFavUseCase>(AddOrRemoveFavUseCase());

  sL.registerSingleton<IsFavUseCase>(IsFavUseCase());

  sL.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sL.registerSingleton<UpdateProfileImageUseCase>(UpdateProfileImageUseCase());
}
