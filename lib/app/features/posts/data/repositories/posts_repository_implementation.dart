import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:json_clean/app/core/helpers/failure.dart';
import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/data/datasource/datasource.dart';

import 'package:json_clean/app/features/posts/domain/entities/entities.dart';

import 'package:json_clean/app/features/posts/domain/repository/repository.dart';

class PostsRepositoryImplementation implements IPostsRepository {
  final IPostsDataSource dataSource;
  PostsRepositoryImplementation({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts(
      NoParams noParams) async {
    try {
      List<PostEntity> result = await dataSource.getPosts(noParams);
      return Right(result);
    } on DioError {
      return Left(Failure(
          status: 500,
          message: "SERVER ERROR",
          type: "SERVER ERROR",
          exception: "SERVER EXCEPTION"));
    }
  }
}
