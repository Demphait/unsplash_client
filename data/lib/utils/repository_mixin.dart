import 'dart:developer';
import 'dart:io' show HttpStatus;
import 'package:core/utils/data_state.dart';
import 'package:data/errors/exceptions.dart';
import 'package:data/network/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

mixin RepositoryMixin {
  Future<Either<Failure, T>> invoke<T>(Future<T> Function() request) async {
    try {
      return Right(await request());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode, e.detail ?? e));
    } on NoInternetException catch (e) {
      return Left(NoInternetConnectionFailure(e));
    } catch (e) {
      log(e.toString());
      return Left(GeneralFailure(e));
    }
  }
}
