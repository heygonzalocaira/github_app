// ignore_for_file: inference_failure_on_function_invocation

import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/settings/cubit/settings_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedPreferencesRepository
    with Mock
    implements SharedPreferencesRepository {}

void main() {
  late SharedPreferencesRepository mockSharedPreferencesRepository;
  group('Test cases for SettingsCubit', () {
    setUpAll(() {
      mockSharedPreferencesRepository = MockSharedPreferencesRepository();
    });
    group(
      'Method changeLanguage',
      () {
        blocTest(
          'Should emit a new locale and theme with init method',
          setUp: () {
            when(() => mockSharedPreferencesRepository.getIsDark())
                .thenAnswer((_) async => true);
            when(() => mockSharedPreferencesRepository.getLocale())
                .thenAnswer((_) async => 'en');
          },
          build: () => SettingsCubit(
            sharedPreferencesRepository: mockSharedPreferencesRepository,
          ),
          act: (settingsCubit) => settingsCubit.init(),
          expect: () => [const SettingsState(isDark: true)],
        );

        blocTest(
          'Should emit a new locale',
          setUp: () {
            when(() => mockSharedPreferencesRepository.setLocale('en'))
                .thenAnswer((_) async => Future<void>);
          },
          build: () => SettingsCubit(
            sharedPreferencesRepository: mockSharedPreferencesRepository,
          ),
          act: (settingsCubit) => settingsCubit.changeLanguage(data: 'en'),
          expect: () => [const SettingsState()],
        );

        blocTest(
          'Should emit a new theme',
          setUp: () {
            when(() => mockSharedPreferencesRepository.setIsDark(true))
                .thenAnswer((_) async => Future<void>);
          },
          build: () => SettingsCubit(
            sharedPreferencesRepository: mockSharedPreferencesRepository,
          ),
          act: (settingsCubit) => settingsCubit.changeTheme(isDark: true),
          expect: () => [
            const SettingsState(isDark: true),
          ],
        );
      },
    );
  });
}
