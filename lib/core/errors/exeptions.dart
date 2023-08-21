import '../words/message_words.dart';
import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException(this.errorMessageModel);

  factory ServerException.anError(String? message) {
    return ServerException(
        ErrorMessageModel(statusMessage: message ?? MessageWords.error));
  }
}

class NoInternetException implements Exception {
  final String message = MessageWords.noInternet;
  NoInternetException();
}

class LocalExcption implements Exception {
  final String message;
  const LocalExcption(this.message);
}
