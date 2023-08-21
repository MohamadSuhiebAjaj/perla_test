// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:perla_test/modules/authentication/domain/usecases/register_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterButtonPressedEvent>(_register);
  }

  FutureOr<void> _register(RegisterButtonPressedEvent event, emit) async {
    emit(LoadingRegisterState());
    final result = await registerUseCase(
      RegisterParameters(
        phoneNumber: event.phoneNumber,
        password: event.password,
        fullName: event.fullName,
      ),
    );
    result.fold((l) {
      emit(FailureRegisterState(l.message));
    }, (r) {
      emit(SuccessRegisterState(r));
      // TODO: 
      // push to home screen
    });
  }
}
