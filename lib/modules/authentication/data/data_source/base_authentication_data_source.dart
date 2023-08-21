import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../model/user_model.dart';

abstract class BaseAuthenticationDataSource {
  Future<UserModel> login(LoginParameters parameters);
  Future<UserModel> register(RegisterParameters parameters);
}
