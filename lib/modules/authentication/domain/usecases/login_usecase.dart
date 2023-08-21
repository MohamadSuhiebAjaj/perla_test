// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_cases.dart';
import '../entities/user_entity.dart';
import '../repository/base_authentication_repository.dart';

class LoginUseCase extends BaseUseCase<UserEntity, LoginParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  LoginUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParameters parameters) {
    return baseAuthenticationRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String phoneNumber;
  final String password;

  const LoginParameters({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "phone": phoneNumber,
        "password": password,
      };

  @override
  List<Object> get props => [phoneNumber, password];
}
