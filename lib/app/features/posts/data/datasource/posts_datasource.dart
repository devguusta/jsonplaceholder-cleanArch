import 'package:dartz/dartz.dart';
import 'package:json_clean/app/core/helpers/helpers.dart';
import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/data/models/posts_model.dart';

abstract class IPostsDataSource {
  Future<Either<Failure, List<PostsModel>>> getPosts(NoParams noparams);
}
