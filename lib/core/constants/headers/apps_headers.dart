import '../../storage/storage_handler.dart';

class AppHeaders {
  static const Map<String, dynamic> headerWithoutToken = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, dynamic> get header => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${StorageHandler().token}',
      };
}
