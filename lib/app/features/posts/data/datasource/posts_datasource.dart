import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/domain/entities/entities.dart';

abstract class IPostsDataSource {
  Future<List<PostEntity>> getPosts(NoParams noparams);
}
