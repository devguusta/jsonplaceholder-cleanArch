import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:json_clean/app/core/endpoints/jsonplaceholder_endpoint.dart';
import 'package:json_clean/app/core/helpers/failure.dart';
import 'package:json_clean/app/core/helpers/helpers.dart';
import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/data/datasource/posts_datasource.dart';
import 'package:json_clean/app/features/posts/data/models/posts_model.dart';

class PostsDataSourceImplementation implements IPostsDataSource {
  final Dio httpClient;
  PostsDataSourceImplementation({
    required this.httpClient,
  });

  @override
  Future<Either<Failure, List<PostsModel>>> getPosts(NoParams noparams) async {
    final response = await httpClient.get(JsonPlaceHolderEndPoints.apiKey);
    List<PostsModel> decodePosts = [];
    if (response.statusCode == 200 && response.data != null) {
      decodePosts =
          (response.data as List).map((e) => PostsModel.fromMap(e)).toList();
      return Right((decodePosts));
    } else {
      return Left(Failure(
          status: response.statusCode ?? 0,
          message: response.statusMessage ?? "Não foi possível buscar os posts",
          type: "SERVER ERROR",
          exception: "SERVER ERROR"));
    }
  }
}
