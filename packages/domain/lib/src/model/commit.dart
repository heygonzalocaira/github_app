import 'package:equatable/equatable.dart';

/// Commit object for repository
class Commit extends Equatable {
  /// Constructor
  const Commit({
    required this.authorName,
    required this.email,
    required this.date,
    required this.message,
    required this.url,
    required this.authorLogin,
    required this.avatarUrl,
  });

  /// name of author of commit
  final String authorName;

  /// email of commit's author
  final String email;

  /// date for commit
  final String date;

  /// description of commit
  final String message;

  /// url of commit
  final String url;

  /// nick of user
  final String authorLogin;

  /// url of user image in github
  final String avatarUrl;

  @override
  List<Object?> get props => [
        authorName,
        authorLogin,
        email,
        date,
        url,
        avatarUrl,
      ];
}
