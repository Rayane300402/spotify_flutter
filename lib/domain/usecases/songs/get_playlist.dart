import 'package:dartz/dartz.dart';
import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../../repo/song/song.dart';

class GetPlaylistUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sL<SongsRepo>().getPlaylist();
  }

}