import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/app_failures.dart';
import '../entities/post_entity.dart';

class AddPostUseCase {
  final PostsRepo postsRepo;

  AddPostUseCase(this.postsRepo);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await postsRepo.addPost(postEntity);
  }
}
