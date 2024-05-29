import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/get_all_posts_use_case.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit(this.getAllPostsUseCase) : super(GetPostsInitial());

  GetAllPostsUseCase getAllPostsUseCase;

  Future<void> getAllPosts() async {
    emit(GetPostsLoading());
    var result = await getAllPostsUseCase.call();

    result.fold(
      (failure) {
        emit(GetPostsFailure(failure.failureMessage));
      },
      (fetchPosts) {
        emit(GetPostsSuccess(fetchPosts));
      },
    );
  }
}
