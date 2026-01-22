import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/songs/add_or_remove_fav.dart';
import '../../../service_locator.dart';

class FavoritesState {
  final Set<String> ids;
  const FavoritesState(this.ids);
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState({}));

  StreamSubscription? _sub;

  void startListening(String uid) {
    _sub?.cancel();
    _sub = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Favorites')
        .snapshots()
        .listen((snap) {
      final ids = snap.docs
          .map((d) => d.data()['songId'] as String)
          .toSet();
      emit(FavoritesState(ids));
    });
  }

  Future<void> toggle(String songId) async {
    await sL<AddOrRemoveFavUseCase>().call(params: songId);
    // No manual emit needed if you listen to snapshots — stream will update state.
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
