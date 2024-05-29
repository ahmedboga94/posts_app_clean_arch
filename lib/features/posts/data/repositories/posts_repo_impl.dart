import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/core/app_failures.dart';
import 'package:posts_app_clean/core/app_network_info.dart';
import 'package:posts_app_clean/features/posts/data/models/post_model.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

typedef AddOrDeleteOrUpdatePostFunc = Future<Unit> Function(PostModel);

class PostsRepoImpl implements PostsRepo {
  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;
  final AppNetworkInfo networkInfo;

  PostsRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return right(remotePosts);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFaliure.fromDioError(e));
        } else {
          return left(ServerFaliure(failureMessage: "$e"));
        }
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();

        return right(localPosts);
      } catch (e) {
        return Left(
            EmptyCasheFailure(failureMessage: "There is no posts are cached"));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity postEntity) async {
    return await _checkAndGet(
        postEntity: postEntity,
        addOrDeleteOrUpdatePostFunc: (postModel) {
          return remoteDataSource.addPost(postModel);
        });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(PostEntity postEntity) async {
    return await _checkAndGet(
        postEntity: postEntity,
        addOrDeleteOrUpdatePostFunc: (postModel) {
          return remoteDataSource.deletePost(postModel);
        });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity postEntity) async {
    return await _checkAndGet(
        postEntity: postEntity,
        addOrDeleteOrUpdatePostFunc: (postModel) {
          return remoteDataSource.updatePost(postModel);
        });
  }

  @override
  Either<Failure, ThemeDeviceState> setTheme(ThemeDeviceState deviceTheme) {
    try {
      var themeSelector = localDataSource.setTheme(deviceTheme);
      return right(themeSelector);
    } catch (e) {
      return left(Failure(failureMessage: "Error in setting theme"));
    }
  }

  Future<Either<Failure, Unit>> _checkAndGet(
      {required PostEntity postEntity,
      required AddOrDeleteOrUpdatePostFunc addOrDeleteOrUpdatePostFunc}) async {
    final postModel = PostModel(
        id: postEntity.id, title: postEntity.title, body: postEntity.body);

    if (await networkInfo.isConnected) {
      try {
        await addOrDeleteOrUpdatePostFunc(postModel);
        return right(unit);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFaliure.fromDioError(e));
        } else {
          return left(ServerFaliure(failureMessage: "$e"));
        }
      }
    } else {
      return left(
        OfflineFailure(
            failureMessage: "Your Device is not connecting to Internet"),
      );
    }
  }
}
