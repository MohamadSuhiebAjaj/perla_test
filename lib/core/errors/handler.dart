
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'error_message_model.dart';
import 'exeptions.dart';
import 'failure.dart';
import '../words/message_words.dart';
import '../services/network_helper.dart';

typedef FutureFunction<T> = Future<T> Function();
typedef RequestFunction<T> = Future<Response<T>> Function();

class ExceptionsHandler {
  // this function to handel server exceptions
  static Future<Either<Failure, T>> handleServerException<T>(
    FutureFunction<T> future,
  ) async {
    try {
      final result = await future();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on NoInternetException catch (_) {
      return Left(NoInternetFailer());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

// this function to handler local exception
  static Future<Either<Failure, T>> handleLocalException<T>(
      FutureFunction function) async {
    try {
      final result = await function();
      return Right(result);
    } on LocalExcption catch (e) {
      return Left(LocalFailure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

// this function to handle APIs exception this make you don't have to call any try catch in your code
  static Future<AppResponse> globalExceptionHandler(
      RequestFunction function) async {
    try {
      final response = await function();
      return AppResponse.fromDioResponse(response);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!));
      }
      if (e.response != null) {
        throw ServerException.anError(MessageWords.error);
      }
      throw NoInternetException();
    }
  }
}
