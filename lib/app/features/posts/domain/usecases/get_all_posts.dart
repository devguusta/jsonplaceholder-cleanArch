import 'package:dartz/dartz.dart';

import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/domain/repository/repository.dart';

import '../../../../core/helpers/helpers.dart';
import '../entities/entities.dart';

class GetAllPosts implements Usecase<List<PostEntity>, NoParams> {
  final IPostsRepository repository;
  GetAllPosts({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams noParams) async {
    return await repository.getAllPosts(noParams);
  }
}
