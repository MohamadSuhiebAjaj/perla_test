part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  final UserEntity entity;
  const SuccessRegisterState(this.entity);
}

class FailureRegisterState extends RegisterState {
  final String message;
  const FailureRegisterState(this.message);
}
