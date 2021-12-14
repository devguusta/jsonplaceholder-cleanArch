import 'package:dartz/dartz.dart';
import 'package:json_clean/app/core/helpers/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
