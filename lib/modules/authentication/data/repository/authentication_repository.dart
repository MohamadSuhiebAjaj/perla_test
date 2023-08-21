import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/handler.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/base_authentication_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../data_source/base_authentication_data_source.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseAuthenticationDataSource baseAuthenticationDataSource;
  AuthenticationRepository(this.baseAuthenticationDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParameters parameters) {
    return ExceptionsHandler.handleServerException(
        () => baseAuthenticationDataSource.login(parameters));
  }

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters) {
    return ExceptionsHandler.handleServerException(
        () => baseAuthenticationDataSource.register(parameters));
  }
}
