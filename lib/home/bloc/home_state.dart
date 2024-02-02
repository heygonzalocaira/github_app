part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccess extends HomeState {
  HomeSuccess({required this.commits});

  final List<Commit> commits;

  @override
  List<Object?> get props => [commits];
}

class HomeError extends HomeState {
  HomeError({required this.errorMessage});

  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
