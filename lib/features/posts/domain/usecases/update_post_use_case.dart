import 'package:dartz/dartz.dart';

import '../../../../core/app_failures.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repo.dart';

class UpdatePostUseCase {
  final PostsRepo postsRepo;

  UpdatePostUseCase(this.postsRepo);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await postsRepo.updatePost(postEntity);
  }
}
