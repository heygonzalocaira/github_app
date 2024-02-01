// ignore_for_file: one_member_abstracts

import 'package:fulltimeforce_challenge/data/entities/commit_entity.dart';

/// Abstract class, implement the methos in Api implementation classs
abstract class Api {
  /// Method to get list of commits from API
  Future<List<CommitEntity>> geListOfCommits();
}
