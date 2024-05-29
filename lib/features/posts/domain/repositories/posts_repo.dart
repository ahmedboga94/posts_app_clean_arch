import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/core/app_failures.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, Unit>> addPost(PostEntity postEntity);
  Future<Either<Failure, Unit>> deletePost(PostEntity postEntity);
  Future<Either<Failure, Unit>> updatePost(PostEntity postEntity);

  Either<Failure, ThemeDeviceState> setTheme(ThemeDeviceState deviceTheme);
}
