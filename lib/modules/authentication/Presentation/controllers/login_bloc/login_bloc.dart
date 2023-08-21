// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:perla_test/modules/authentication/domain/entities/user_entity.dart';
import 'package:perla_test/modules/authentication/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_login);
  }

  FutureOr<void> _login(LoginButtonPressedEvent event, emit) async {
    emit(LoadingLoginState());
    final result = await loginUseCase(
      LoginParameters(
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );
    result.fold((l) {
      emit(FailureLoginState(l.message));
    }, (r) {
      emit(SuccessLoginState(r));
      
    });
  }
}
