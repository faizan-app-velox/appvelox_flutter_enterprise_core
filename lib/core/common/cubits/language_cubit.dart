import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LanguageCubit extends HydratedCubit<Locale> {
  // Default to English
  LanguageCubit() : super(const Locale('en'));

  void toggleLanguage() {
    if (state.languageCode == 'en') {
      emit(const Locale('es')); // Switch to Spanish
    } else {
      emit(const Locale('en')); // Switch to English
    }
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['language_code'] as String);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'language_code': state.languageCode};
  }
}
