// ignore_for_file: inference_failure_on_function_invocation, avoid_dynamic_calls, lines_longer_than_80_chars

import 'package:data/data.dart';

import 'package:dio/dio.dart';

/// GithubApi is a class that consume the Api of github,
/// has a method to obtain all the commit from a repository
class GithubApi implements Api {
  /// Dio for queries
  final Dio dio = Dio();

  /// Base url of API
  static const String baseUrl = 'https://api.github.com';

  /// Endpoint url
  static const String endpoint =
      '/repos/heygonzalocaira/fulltimeforce_challenge/commits';

  @override
  Future<List<CommitEntity>> geListOfCommits() async {
    try {
      final response = await dio.get(
        baseUrl + endpoint,
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
    } on DioException catch (error) {
      final message = error.response?.data?['message'] as String?;
      throw OnDioException(errorMessage: message ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
