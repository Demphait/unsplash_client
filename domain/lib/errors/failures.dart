import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.exception);

  final Object exception;

  @override
  String toString() => exception.toString();
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.exception);

  @override
  List<Object?> get props => [exception];
}

class ServerFailure extends Failure {
  const ServerFailure(this.statusCode, exception) : super(exception);

  final int? statusCode;

  @override
  List<Object?> get props => [statusCode, exception];
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure(super.exception);

  @override
  List<Object?> get props => [exception];
}

