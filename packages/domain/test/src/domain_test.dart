// ignore_for_file: prefer_const_constructors

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApi with Mock implements GithubApi {}

void main() {
  late Api mockGithubApi;
  late GithubRepository githubRepository;
  group('GithubApi', () {
    setUpAll(() {
      mockGithubApi = MockApi();
      githubRepository = GithubRepository(gihubApi: mockGithubApi);
    });
    test('Get commits', () async {
      when(() => mockGithubApi.geListOfCommits())
          .thenAnswer((invocation) async => []);

      final commits = await githubRepository.getCommits();

      expect(commits.length, 0);
    });

    test('Get commits and getting a error', () async {
      when(() => mockGithubApi.geListOfCommits())
          .thenThrow(JsonSerializationException());

      expect(() => githubRepository.getCommits(), throwsException);
      when(() => mockGithubApi.geListOfCommits())
          .thenThrow(JsonSerializationException());
    });
  });
}
