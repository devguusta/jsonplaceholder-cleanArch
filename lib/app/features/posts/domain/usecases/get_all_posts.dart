import 'package:dartz/dartz.dart';

import '../../../../core/helpers/helpers.dart';
import '../entities/entities.dart';

abstract class GetAllPosts {
  Future<Either<Failure, Success<List<PostsEntities>>>> call();
}
