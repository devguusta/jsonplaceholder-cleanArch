import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_clean/app/core/usecase.dart';

import 'package:json_clean/app/features/posts/domain/usecases/usecases.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_state.dart';

class PostsBloc extends Cubit<PostsState> {
  final GetAllPosts getAllPosts;
  final NoParams noParams = NoParams();
  PostsBloc(
    this.getAllPosts,
  ) : super(PostsStateEmpty());

  Future<void> getPosts() async {
    emit(PostsStateLoading());
    final result = await getAllPosts.call(noParams);
    result.fold((l) => emit(PostsStateFailure(error: l)),
        (r) => emit(PostsStateSuccess(listPost: r)));
  }
}
