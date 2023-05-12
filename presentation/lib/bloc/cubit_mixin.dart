import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

mixin CubitMixin {
  Future<Either<Failure, T>> invoke<T>(Future<Either<Failure, T>> job) async {
    return (await job).fold(
      (failure) async {
        if (failure is NoInternetConnectionFailure) {
          return Left(
            NoInternetConnectionFailure(failure.exception),
          );
        } else if (failure is ServerFailure) {
          return Left(
            ServerFailure(failure.statusCode, failure.exception),
          );
        }
        return Left(failure);
      },
      Right.new,
    );
  }
}
