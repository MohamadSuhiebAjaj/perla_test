import 'package:dio/dio.dart';
import '../errors/handler.dart';

import '../constants/headers/apps_headers.dart';

class NetworkHelper {
  static Future<AppResponse> post(
    String url, {
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    return ExceptionsHandler.globalExceptionHandler(
      () => Dio().post(
        url,
        data: data,
        options: Options(headers: headers ?? AppHeaders.header),
      ),
    );
  }

  static Future<AppResponse> put(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    return ExceptionsHandler.globalExceptionHandler(() => Dio().put(
          url,
          data: data,
          options: Options(headers: headers ?? AppHeaders.header),
        ));
  }

  static Future<AppResponse> delete(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    return ExceptionsHandler.globalExceptionHandler(() => Dio().delete(
          url,
          data: data,
          options: Options(headers: headers ?? AppHeaders.header),
        ));
  }

  static Future<AppResponse> get(String url,
      {Map<String, dynamic>? headers}) async {
    return ExceptionsHandler.globalExceptionHandler(
      () => Dio().get(
        url,
        options: Options(headers: headers ?? AppHeaders.header),
      ),
    );
  }
}

class AppResponse {
  final dynamic data;
  final Map<String, String> headers;
  final int? statusCode;
  AppResponse({this.statusCode, required this.headers, this.data});

  factory AppResponse.fromDioResponse(Response response) => AppResponse(
        statusCode: response.statusCode,
        headers: response.headers.map
            .map((key, value) => MapEntry(key, value.first)),
        data: response.data,
      );
}
