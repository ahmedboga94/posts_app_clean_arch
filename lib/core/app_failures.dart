import 'package:dio/dio.dart';

class Failure {
  final String failureMessage;

  Failure({required this.failureMessage});
}

class OfflineFailure extends Failure {
  OfflineFailure({required super.failureMessage});
}

class ServerFaliure extends Failure {
  ServerFaliure({required super.failureMessage});

  factory ServerFaliure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(
            failureMessage: "Connection time out, please try again");
      case DioExceptionType.sendTimeout:
        return ServerFaliure(failureMessage: "Send time out, please try again");
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(
            failureMessage: "Receive time out, please try again");
      case DioExceptionType.badCertificate:
        return ServerFaliure(failureMessage: "Bad Certificate with API Server");
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(e);
      case DioExceptionType.cancel:
        return ServerFaliure(failureMessage: "Request to server was canceld");
      case DioExceptionType.connectionError:
        return ServerFaliure(failureMessage: "No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFaliure(
            failureMessage: "Opps There was an Error, please try again");
    }
  }

  factory ServerFaliure.fromResponse(DioException e) {
    if (e.response!.statusCode == 404) {
      return ServerFaliure(
          failureMessage: "Your request was not found, please try later");
    } else if (e.response!.statusCode == 500) {
      return ServerFaliure(
          failureMessage: "There is problem with Server, please try later");
    } else if (e.response!.statusCode == 400 ||
        e.response!.statusCode == 401 ||
        e.response!.statusCode == 403) {
      return ServerFaliure(
          failureMessage: e.response!.data["error"]["message"]);
    } else {
      return ServerFaliure(
          failureMessage: "Opps There was an Error, please try again");
    }
  }
}

class EmptyCasheFailure extends Failure {
  EmptyCasheFailure({required super.failureMessage});
}
