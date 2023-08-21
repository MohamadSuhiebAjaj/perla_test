part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressedEvent extends RegisterEvent {
  final String phoneNumber;
  final String password;
  final String fullName;

  const RegisterButtonPressedEvent({
    required this.phoneNumber,
    required this.password,
    required this.fullName,
  });
}
