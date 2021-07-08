import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  List<Object?> get props => [];
}

// General Failures
class ServerFailure extends Failure {

  int? errorCode;
  String? message;
  String? stacktrace;

  ServerFailure({this.errorCode, this.message, this.stacktrace});

  static create(DioError error){
    return ServerFailure(
      errorCode: error.response?.statusCode,
      stacktrace: error.message,
    );
  }
}