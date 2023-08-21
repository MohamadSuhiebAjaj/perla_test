import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static StorageHandler? _instance;
  static SharedPreferences? _preferences;

  StorageHandler._();

  factory StorageHandler() => _instance ??= StorageHandler._();

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) async {
    await _preferences?.setString('token', token);
  }

  Future<void> removeToken() async {
    await _preferences?.remove('token');
  }

  bool get hasToken {
    return _preferences?.containsKey('token') ?? false;
  }

  String get token => _preferences?.getString('token') ?? 'no token';

  Future<void> setUserName(String token) async {
    await _preferences?.setString('userName', token);
  }

  Future<void> removeUserName() async {
    await _preferences?.remove('userName');
  }

  bool get hasUserName {
    return _preferences?.containsKey('userName') ?? false;
  }

  String? get userName =>
      hasUserName ? _preferences?.getString('userName') : null;
}
