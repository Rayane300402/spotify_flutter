import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ModeCubit extends  HydratedCubit<ThemeMode> {

  ModeCubit() : super(ThemeMode.system);

  void switchMode(ThemeMode themeMode) => emit(themeMode);

  bool get hasChosenMode => state != ThemeMode.system;

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final idx = json['theme'];
    if (idx is int && idx >= 0 && idx < ThemeMode.values.length) {
      return ThemeMode.values[idx];
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {'theme': state.index};

  // @override
  // ThemeMode? fromJson(Map<String, dynamic> json) {
  //   return ThemeMode.values[json['theme'] as int];
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(ThemeMode state) {
  //   return {'theme': state.index};
  // }

}