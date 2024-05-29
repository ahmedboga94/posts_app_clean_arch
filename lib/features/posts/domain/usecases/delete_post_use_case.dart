import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/app_failures.dart';

class DeletePostUseCase {
  final PostsRepo postsRepo;

  DeletePostUseCase(this.postsRepo);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await postsRepo.deletePost(postEntity);
  }
}
