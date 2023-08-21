import '../../../../core/constants/urls/api_urls.dart';
import '../../../../core/constants/headers/apps_headers.dart';
import '../../../../core/services/network_helper.dart';
import '../../../../core/storage/storage_handler.dart';
import '../model/user_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

import 'base_authentication_data_source.dart';

class AuthenticationDataSource extends BaseAuthenticationDataSource {
  @override
  Future<UserModel> login(LoginParameters parameters) async {
    AppResponse response = await NetworkHelper.post(
      Apisurls.login,
      data: parameters.toJson(),
      headers: AppHeaders.headerWithoutToken,
    );
    await StorageHandler().setToken(response.data['data']['token']);
    await StorageHandler()
        .setUserName(response.data['data']['user']['username']);
    return UserModel.fromJson(response.data['data']['user']);
  }

  @override
  Future<UserModel> register(RegisterParameters parameters) async {
    AppResponse response = await NetworkHelper.post(
      Apisurls.register,
      data: parameters.toJson(),
      headers: AppHeaders.headerWithoutToken,
    );
    await StorageHandler().setToken(response.data['data']['token']);
    await StorageHandler()
        .setUserName(response.data['data']['user']['username']);
    return UserModel.fromJson(response.data['data']['user']);
  }
}
