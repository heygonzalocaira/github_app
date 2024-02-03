// ignore_for_file: inference_failure_on_function_invocation

import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/home/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubRepository with Mock implements GithubRepository {}

void main() {
  late GithubRepository mockGithubRepository;
  group('Test cases for HomeBloc', () {
    setUpAll(() {
      mockGithubRepository = MockGithubRepository();
    });
    group(
      'Event LoadDataEvent',
      () {
        blocTest(
          'Should emit a new list of commits',
          setUp: () {
            when(() => mockGithubRepository.getCommits())
                .thenAnswer((_) async => []);
          },
          build: () => HomeBloc(
            githubRepository: mockGithubRepository,
          ),
          act: (homeBloc) => homeBloc.add(LoadDataEvent()),
          expect: () => [
            HomeLoading(),
            HomeSuccess(commits: const []),
          ],
        );

        blocTest(
          'Should throw a error',
          setUp: () {
            when(() => mockGithubRepository.getCommits())
                .thenThrow(Exception());
          },
          build: () => HomeBloc(
            githubRepository: mockGithubRepository,
          ),
          act: (homeBloc) => homeBloc.add(LoadDataEvent()),
          expect: () => [
            HomeLoading(),
            HomeError(errorMessage: 'Exception'),
          ],
        );
      },
    );
  });
}
