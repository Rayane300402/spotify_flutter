import 'package:get_it/get_it.dart';
import 'package:spotify_futter/data/repo/auth/auth_repo_imp.dart';
import 'package:spotify_futter/data/repo/song/song_repo.dart';
import 'package:spotify_futter/data/sources/auth/auth_firebase.dart';
import 'package:spotify_futter/data/sources/songs/songs_db_service.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import 'package:spotify_futter/domain/usecases/auth/register.dart';
import 'package:spotify_futter/domain/usecases/auth/signin.dart';
import 'package:spotify_futter/domain/usecases/songs/get_songs.dart';



final sL = GetIt.instance;

Future<void> initDep() async{

  sL.registerSingleton<AuthFirebase>(
    AuthFirebaseService()
  );

  sL.registerSingleton<SongService>(
      SongServiceImp()
  );

  sL.registerSingleton<AuthRepo>(
      AuthRepoImp()
  );

  sL.registerSingleton<SongsRepo>(
      SongRepoImp()
  );

  sL.registerSingleton<RegisterUseCase>(
      RegisterUseCase()
  );

  sL.registerSingleton<SignInUseCase>(
    SignInUseCase()
  );

  sL.registerSingleton<GetSongsUseCase>(
      GetSongsUseCase()
  );

}