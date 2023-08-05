import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server!');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api Server!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Receive Timeout with Api Server!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Receive Timeout with Api Server!');
      case DioExceptionType.connectionError:
        return ServerFailure('Receive Timeout with Api Server!');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error');
      default:
        return ServerFailure('Ops!!!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Server Error');
    } else {
      return ServerFailure('Ops!!!');
    }
  }
}
