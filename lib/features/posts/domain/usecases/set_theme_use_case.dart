import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/core/app_failures.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';

class SetThemeUseCase {
  final PostsRepo postsRepo;
  SetThemeUseCase(this.postsRepo);

  Either<Failure, ThemeDeviceState> call(ThemeDeviceState deviceTheme) {
    return postsRepo.setTheme(deviceTheme);
  }
}
