part of 'get_posts_cubit.dart';

abstract class GetPostsState {}

final class GetPostsInitial extends GetPostsState {}

final class GetPostsLoading extends GetPostsState {}

final class GetPostsSuccess extends GetPostsState {
  final List<PostEntity> posts;

  GetPostsSuccess(this.posts);
}

final class GetPostsFailure extends GetPostsState {
  final String errorMessage;

  GetPostsFailure(this.errorMessage);
}
