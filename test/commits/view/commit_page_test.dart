import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/commits/commits.dart';
import 'package:fulltimeforce_challenge/commits/widgets/commit_card.dart';
import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:fulltimeforce_challenge/utils/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockCommitModel extends Mock implements Commit {}

void main() {
  late HomeBloc mockHomeBloc;
  late Commit mockCommitModel;
  group('Testing view for CommitPage with different states', () {
    setUpAll(() {
      ///* Mock for bloc
      mockHomeBloc = MockHomeBloc();
      mockCommitModel = MockCommitModel();
      when(() => mockCommitModel.authorLogin).thenReturn('someAuthorLogin');
      when(() => mockCommitModel.message).thenReturn('message');
      when(() => mockCommitModel.avatarUrl).thenReturn('avatarUrl');
      when(() => mockCommitModel.date).thenReturn(DateTime.now().toString());
    });

    testWidgets('Render HomeLoading state', (tester) async {
      when(() => mockHomeBloc.state).thenReturn(HomeLoading());

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const CommitsPage(),
        ),
      );
      expect(find.byType(ShimmerBox), findsNWidgets(6));
    });

    testWidgets('Render HomeError state', (tester) async {
      const errorMessage = 'Fail';
      when(() => mockHomeBloc.state).thenReturn(
        HomeError(errorMessage: errorMessage),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const CommitsPage(),
        ),
      );
      expect(find.byIcon(Icons.error), findsOne);
      expect(find.text(errorMessage), findsOne);
    });

    testWidgets('Render HomeSuccess state with zero items', (tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        HomeSuccess(commits: const []),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const CommitsPage(),
        ),
      );
      expect(find.byType(CommitCard), findsNothing);
      expect(find.text('No commits to show'), findsOne);
    });
    testWidgets('Render HomeSuccess state with two items', (tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        HomeSuccess(
          commits: [
            mockCommitModel,
            mockCommitModel,
          ],
        ),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: mockHomeBloc,
          child: const CommitsPage(),
        ),
      );
      expect(find.byType(CommitCard), findsWidgets);
      expect(find.byType(CommitCard), findsNWidgets(2));
    });
  });
}
