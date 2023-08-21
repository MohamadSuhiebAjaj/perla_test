part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<NoteEntity> entities;
  const SuccessHomeState(this.entities);
}

class FailureHomeState extends HomeState {
  final String message;
  const FailureHomeState(this.message);
}
