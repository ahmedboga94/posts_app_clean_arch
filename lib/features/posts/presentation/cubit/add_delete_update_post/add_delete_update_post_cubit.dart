import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/update_post_use_case.dart';

part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostCubit extends Cubit<AddDeleteUpdatePostState> {
  AddDeleteUpdatePostCubit({
    required this.addPostUseCase,
    required this.deletePostUseCase,
    required this.updatePostUseCase,
  }) : super(AddDeleteUpdatePostInitial());

  AddPostUseCase addPostUseCase;
  DeletePostUseCase deletePostUseCase;
  UpdatePostUseCase updatePostUseCase;

  void addPost(PostEntity postEntity) async {
    emit(AddDeleteUpdatePostLoading());
    var result = await addPostUseCase.call(postEntity);
    result.fold(
      (failure) {
        emit(AddDeleteUpdatePostFailure(failure.failureMessage));
      },
      (_) {
        emit(AddDeleteUpdatePostSuccess("Post added Successfully"));
      },
    );
  }

  void deletePost(PostEntity postEntity) async {
    emit(AddDeleteUpdatePostLoading());
    var result = await deletePostUseCase.call(postEntity);
    result.fold(
      (failure) {
        emit(AddDeleteUpdatePostFailure(failure.failureMessage));
      },
      (_) {
        emit(AddDeleteUpdatePostSuccess("Post deleted Successfully"));
      },
    );
  }

  void updatePost(PostEntity postEntity) async {
    emit(AddDeleteUpdatePostLoading());
    var result = await updatePostUseCase.call(postEntity);
    result.fold(
      (failure) {
        emit(AddDeleteUpdatePostFailure(failure.failureMessage));
      },
      (_) {
        emit(AddDeleteUpdatePostSuccess("Post updated Successfully"));
      },
    );
  }
}
