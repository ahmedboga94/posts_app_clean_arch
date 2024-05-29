import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/app_failures.dart';
import '../entities/post_entity.dart';

class GetAllPostsUseCase {
  final PostsRepo postsRepo;
  GetAllPostsUseCase(this.postsRepo);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postsRepo.getAllPosts();
  }
}
