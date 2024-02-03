// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required SharedPreferencesRepository sharedPreferencesRepository,
  })  : _sharedPreferencesRepository = sharedPreferencesRepository,
        super(const SettingsState());

  final SharedPreferencesRepository _sharedPreferencesRepository;

  final String english = 'en';
  final String spanish = 'es';

  Future<void> init() async {
    try {
      final isDark = await _sharedPreferencesRepository.getIsDark();
      final locale = await _sharedPreferencesRepository.getLocale();
      emit(state.copyWith(isDark: isDark, locale: Locale(locale)));
    } catch (e) {
      throw Exception('Exception in init SettingsCubit$e');
    }
  }

  Future<void> changeLanguage({required String data}) async {
    try {
      emit(state.copyWith(locale: Locale(data)));
      await _sharedPreferencesRepository.setLocale(data);
    } catch (error) {
      throw Exception('changeLanguage: $error');
    }
  }

  Future<void> changeTheme({required bool isDark}) async {
    try {
      emit(state.copyWith(isDark: isDark));
      await _sharedPreferencesRepository.setIsDark(isDark);
    } catch (error) {
      throw Exception('changeTheme: $error');
    }
  }
}
