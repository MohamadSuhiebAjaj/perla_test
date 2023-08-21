// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_cases.dart';
import '../entities/user_entity.dart';
import '../repository/base_authentication_repository.dart';

class RegisterUseCase extends BaseUseCase<UserEntity, RegisterParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;
  RegisterUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParameters parameters) {
    return baseAuthenticationRepository.register(parameters);
  }
}

class RegisterParameters extends Equatable {
  final String phoneNumber;
  final String fullName;
  final String password;

  const RegisterParameters({
    required this.phoneNumber,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phoneNumber,
        "password": password,
      };

  @override
  List<Object> get props => [phoneNumber, password];
}
