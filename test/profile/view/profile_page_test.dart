import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:fulltimeforce_challenge/profile/profile.dart';
import 'package:fulltimeforce_challenge/utils/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockCommitModel extends Mock implements Commit {}

void main() {
  late HomeBloc mockHomeBloc;
  late Commit mockCommitModel;
  group('Testing view for ProfilePage with different states', () {
    setUpAll(() {
      ///* Mock for bloc
      mockHomeBloc = MockHomeBloc();
      mockCommitModel = MockCommitModel();
      when(() => mockCommitModel.authorLogin).thenReturn('authorLogin');
      when(() => mockCommitModel.email).thenReturn('email');
      when(() => mockCommitModel.avatarUrl).thenReturn('avatarUrl');
      when(() => mockCommitModel.authorName).thenReturn('authorName');
    });

    testWidgets('HomeLoading state: Render shimmer widgets', (tester) async {
      when(() => mockHomeBloc.state).thenReturn(HomeLoading());

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const ProfilePage(),
        ),
      );
      expect(find.byType(ShimmerCircle), findsOneWidget);
      expect(find.byType(ShimmerBox), findsNWidgets(3));
    });

    testWidgets('HomeError state: Render Icons and error message',
        (tester) async {
      const errorMessage = 'No profile';
      when(() => mockHomeBloc.state).thenReturn(
        HomeError(errorMessage: errorMessage),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const ProfilePage(),
        ),
      );
      expect(find.byType(Icon), findsOne);
      expect(find.byIcon(Icons.error), findsOne);
      expect(find.text(errorMessage), findsOne);
    });

    testWidgets('HomeSuccess state : Render 3 Profile card', (tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        HomeSuccess(commits: [mockCommitModel]),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const ProfilePage(),
        ),
      );
      expect(find.byType(ProfileCard), findsNWidgets(3));
      expect(find.byKey(const Key('Circle Profile')), findsOne);
    });
  });
}
