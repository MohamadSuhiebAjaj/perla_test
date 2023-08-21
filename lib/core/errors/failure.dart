import 'package:equatable/equatable.dart';

import '../words/message_words.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NoInternetFailer extends Failure {
  NoInternetFailer() : super(MessageWords.noInternet);
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}
