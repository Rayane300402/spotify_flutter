import 'package:get_it/get_it.dart';
import 'package:spotify_futter/data/repo/auth/auth_repo_imp.dart';
import 'package:spotify_futter/data/sources/auth/auth_firebase.dart';
import 'package:spotify_futter/domain/repo/auth/auth_repo.dart';
import 'package:spotify_futter/domain/usecases/auth/register.dart';
import 'package:spotify_futter/domain/usecases/auth/signin.dart';



final sL = GetIt.instance;

Future<void> initDep() async{

  sL.registerSingleton<AuthFirebase>(
    AuthFirebaseService()
  );

  sL.registerSingleton<AuthRepo>(
      AuthRepoImp()
  );

  sL.registerSingleton<RegisterUseCase>(
      RegisterUseCase()
  );

  sL.registerSingleton<SignInUseCase>(
    SignInUseCase()
  );

}