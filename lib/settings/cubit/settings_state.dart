// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.isDark = false,
    this.locale = const Locale('en'),
  });

  final Locale locale;
  final bool isDark;
  @override
  List<Object> get props => [locale, isDark];

  SettingsState copyWith({
    Locale? locale,
    bool? isDark,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
    );
  }
}
