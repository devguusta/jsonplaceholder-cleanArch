import 'package:dartz/dartz.dart';

import '../../../../core/helpers/failure.dart';
import '../../../../core/helpers/success.dart';
import '../entities/posts_entities.dart';

abstract class GetAllPosts {
  Future<Either<Failure, Success<PostsEntities>>> call();
}
