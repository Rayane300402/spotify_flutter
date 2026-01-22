import 'package:dartz/dartz.dart';
import 'package:spotify_futter/core/usecases/usecase.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import '../../../service_locator.dart';

class AddOrRemoveFavUseCase implements UseCase<Either, String>{
  @override
  Future<Either> call({String ? params}) async {
    return await sL<SongsRepo>().addOrRemoveFav(params!);
  }

}