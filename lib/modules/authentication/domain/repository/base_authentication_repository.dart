import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../usecases/login_usecase.dart';
import '../usecases/register_usecase.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure, UserEntity>> login(LoginParameters parameters);
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters);
}
