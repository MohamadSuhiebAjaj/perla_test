// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final UserEntity entity;
  const SuccessLoginState(this.entity);
}

class FailureLoginState extends LoginState {
  final String message;
  const FailureLoginState(this.message);
}
