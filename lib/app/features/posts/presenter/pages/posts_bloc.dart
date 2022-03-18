import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_clean/app/core/usecase.dart';
import 'package:json_clean/app/features/posts/domain/usecases/usecases.dart';
import 'package:json_clean/app/features/posts/presenter/pages/post_event.dart';
import 'package:json_clean/app/features/posts/presenter/pages/posts_state.dart';

class PostsCubits extends Cubit<PostsState> {
  final GetAllPosts getAllPosts;
  final NoParams noParams = NoParams();
  PostsCubits(
    this.getAllPosts,
  ) : super(PostsStateEmpty());

  Future<void> getPosts() async {
    emit(PostsStateLoading());
    final result = await getAllPosts.call(noParams);
    result.fold((l) => emit(PostsStateFailure(error: l)),
        (r) => emit(PostsStateSuccess(listPost: r)));
  }
}

class PostsBloc extends Bloc<PostEvent, PostsState> {
  final GetAllPosts getAllPosts;
  PostsBloc(
    this.getAllPosts,
  ) : super(PostsStateEmpty()) {
    on<PostFetchListEvent>((event, emit) async {
      emit(PostsStateLoading());
      final result = await getAllPosts.call(NoParams());
      result.fold((l) => emit(PostsStateFailure(error: l)),
          (r) => emit(PostsStateSuccess(listPost: r)));
    });
  }
}
