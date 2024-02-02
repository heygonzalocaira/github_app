import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GithubRepository githubRepository})
      : _githubRepository = githubRepository,
        super(HomeInitial()) {
    on<LoadDataEvent>(_onLoadDataEvent);
  }

  final GithubRepository _githubRepository;

  FutureOr<void> _onLoadDataEvent(
    LoadDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final commits = await _githubRepository.getCommits();
      emit(HomeSuccess(commits: commits));
    } catch (error) {
      emit(HomeError(errorMessage: error.toString())); // TODO: text the error
    }
  }
}
