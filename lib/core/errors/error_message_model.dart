import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final int? statusCode;
  const ErrorMessageModel({
    required this.statusMessage,
     this.statusCode,
  });

  factory ErrorMessageModel.fromJson(Response response) {
    return ErrorMessageModel(
      statusMessage:
          response.data['message'] ?? response.data['error']['message'],
      statusCode: response.statusCode,
    );
  }

  @override
  List<Object?> get props => [statusMessage];
}
