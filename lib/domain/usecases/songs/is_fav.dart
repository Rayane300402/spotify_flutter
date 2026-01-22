import 'package:spotify_futter/core/usecases/usecase.dart';
import 'package:spotify_futter/domain/repo/song/song.dart';
import '../../../service_locator.dart';

class IsFavUseCase implements UseCase<bool, String>{
  @override
  Future<bool> call({String ? params}) async {
    return await sL<SongsRepo>().isFav(params!);
  }

}