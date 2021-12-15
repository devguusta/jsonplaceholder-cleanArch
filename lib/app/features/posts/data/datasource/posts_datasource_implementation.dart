import 'package:dio/dio.dart';
import 'package:json_clean/app/core/endpoints/endpoints.dart';

import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/data/datasource/datasource.dart';
import 'package:json_clean/app/features/posts/data/models/models.dart';
import 'package:json_clean/app/features/posts/domain/entities/entities.dart';

class PostsDataSourceImplementation implements IPostsDataSource {
  final Dio httpClient;
  PostsDataSourceImplementation({
    required this.httpClient,
  });

  @override
  Future<List<PostEntity>> getPosts(NoParams noparams) async {
    final response = await httpClient.get(JsonPlaceHolderEndPoints.apiKey);
    List<PostEntity> decodePosts = [];
    if (response.statusCode == 200 && response.data != null) {
      decodePosts = (response.data as List)
          .map((e) => PostsModel.fromMap(e).toEntity())
          .toList();
      return decodePosts;
    } else {
      throw ServerException;
    }
  }
}

class ServerException implements Exception {}
