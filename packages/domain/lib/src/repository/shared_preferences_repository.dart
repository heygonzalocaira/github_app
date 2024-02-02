// ignore_for_file: avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

/// Repository to save data of theme and location of app
class SharedPreferencesRepository {
  static const String _isDarkKey = 'isDark';
  static const String _localeKey = 'locale';

  /// Method to get the value of isDark.
  /// Returns true if the value exists, otherwise returns false.
  Future<bool> getIsDark() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isDarkKey) ?? false;
    } catch (e, stackTrace) {
      throw Exception('Error getting isDark preference: $e\n$stackTrace');
    }
  }

  /// Method to set the value of isDark.
  Future<void> setIsDark(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isDarkKey, value);
    } catch (e, stackTrace) {
      throw Exception('Error setting isDark preference: $e\n$stackTrace');
    }
  }

  /// Method to get the value of locale.
  /// Returns the stored locale if it exists, otherwise returns an empty string.
  Future<String> getLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_localeKey) ?? 'en';
    } catch (e, stackTrace) {
      throw Exception('Error getting locale preference: $e\n$stackTrace');
    }
  }

  /// Method to set the value of locale.
  Future<void> setLocale(String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, value);
    } catch (e, stackTrace) {
      throw Exception('Error setting locale preference: $e\n$stackTrace');
    }
  }
}
