// A repository to manage the queries with api

import 'package:data/data.dart' hide Commit;
import 'package:domain/domain.dart';

/// Repository to manage the queries to github api
class GithubRepository {
  /// Optional constructor for testing purposes
  GithubRepository({Api? gihubApi}) : _gihubApi = gihubApi ?? GithubApi();

  final Api _gihubApi;

  /// Method to get a list of commits
  Future<List<Commit>> getCommits() async {
    try {
      final commitEntities = await _gihubApi.geListOfCommits();
      final commits = commitEntities
          .map(
            (item) => Commit(
              authorName: item.commit.author.name,
              email: item.commit.author.email,
              date: item.commit.author.date.toString(),
              message: item.commit.message,
              url: item.commit.url,
              authorLogin: item.author.login,
              avatarUrl: item.author.avatarUrl,
            ),
          )
          .toList();
      return commits;
    } catch (error) {
      throw Exception('Error in getCommits from GithubRepository: $error');
    }
  }
}
