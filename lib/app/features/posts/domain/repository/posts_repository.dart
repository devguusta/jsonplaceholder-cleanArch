import 'package:dartz/dartz.dart';
import 'package:json_clean/app/core/helpers/failure.dart';
import 'package:json_clean/app/core/helpers/success.dart';
import 'package:json_clean/app/features/posts/domain/entities/posts_entities.dart';

abstract class IPostsRepository {
  Future<Either<Failure, Success<PostsEntities>>> getAllPosts();
}
