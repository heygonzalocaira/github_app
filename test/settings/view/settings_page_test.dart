import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fulltimeforce_challenge/settings/cubit/settings_cubit.dart';
import 'package:fulltimeforce_challenge/settings/setttings.dart';

import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockSettingsCubit extends MockCubit<SettingsState>
    implements SettingsCubit {}

void main() {
  late SettingsCubit mockSettingsCubit;

  group('Testing view for Settings with different states', () {
    setUpAll(() {
      ///* Mock for cubit
      mockSettingsCubit = MockSettingsCubit();
    });

    testWidgets('Render widgets for Settings', (tester) async {
      when(() => mockSettingsCubit.state).thenReturn(const SettingsState());
      when(() => mockSettingsCubit.spanish).thenReturn('es');
      when(() => mockSettingsCubit.english).thenReturn('en');
      await tester.pumpApp(
        BlocProvider.value(
          value: mockSettingsCubit,
          child: const SettingsPage(),
        ),
      );
      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(LanguageStatusWidget), findsNWidgets(2));
    });
  });
}
