abstract class PostEvent {}

class PostFetchListEvent extends PostEvent {}

class PostFetchDetailEvent extends PostEvent {
  final int id;

  PostFetchDetailEvent(this.id);
}
