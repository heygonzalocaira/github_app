// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:fulltimeforce_challenge/data/entities/commit_entity.dart';
import 'package:fulltimeforce_challenge/data/errors/custom_exception.dart';
import 'package:fulltimeforce_challenge/data/services/api.dart';
import 'package:fulltimeforce_challenge/data/services/api_key.dart';

class GithubApi implements Api {
  final Dio dio = Dio();
  static const String baseUrl = 'https://api.github.com';
  static const String endpoint =
      '/repos/heygonzalocaira/fulltimeforce_challenge/commits';

  @override
  Future<List<CommitEntity>> geListOfCommits() async {
    final headers = {'Authorization': 'Bearer $githubApiKey'};
    try {
      final response = await dio.get(
        baseUrl + endpoint,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        try {
          final commits = data
              .map(
                (item) => CommitEntity.fromJson(item as Map<String, dynamic>),
              )
              .toList();
          return commits;
        } catch (error) {
          throw JsonSerializationException(errorMessage: error.toString());
        }
      } else {
        throw StatusCodeException();
      }
    } catch (error) {
      rethrow;
    }
  }
}
