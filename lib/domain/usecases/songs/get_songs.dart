import 'package:dartz/dartz.dart';
import 'package:spotify_futter/core/usecases/usecase.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import '../../../service_locator.dart';

class GetSongsUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sL<SongsRepo>().getSongs();
  }

}