part of 'add_delete_update_post_cubit.dart';

abstract class AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostLoading extends AddDeleteUpdatePostState {}

final class AddDeleteUpdatePostSuccess extends AddDeleteUpdatePostState {
  final String posts;

  AddDeleteUpdatePostSuccess(this.posts);
}

final class AddDeleteUpdatePostFailure extends AddDeleteUpdatePostState {
  final String errorMessage;

  AddDeleteUpdatePostFailure(this.errorMessage);
}
