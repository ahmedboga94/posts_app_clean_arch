import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app_clean/core/api_service.dart';
import 'package:posts_app_clean/core/app_network_info.dart';
import 'package:posts_app_clean/features/posts/data/datasources/local_data_source.dart';
import 'package:posts_app_clean/features/posts/data/datasources/remote_data_source.dart';
import 'package:posts_app_clean/features/posts/data/repositories/posts_repo_impl.dart';
import 'package:posts_app_clean/features/posts/domain/repositories/posts_repo.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/get_all_posts_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/set_theme_use_case.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/update_post_use_case.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/add_delete_update_post/add_delete_update_post_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/get_posts/get_posts_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/theme/set_theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future<void> initDi() async {
  //! Feature - Post
  await diPostsFeature();
  //core
  await diCoreAndExternal();
}

Future<void> diCoreAndExternal() async {
  //core
  di.registerLazySingleton<AppNetworkInfo>(() => NetworkInfoImpl(di()));
  di.registerLazySingleton<ApiService>(() => ApiService(di()));

  //External
  final sharedPref = await SharedPreferences.getInstance();

  di.registerLazySingleton(() => sharedPref);
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => InternetConnectionChecker());
}

Future<void> diPostsFeature() async {
  //cubit
  di.registerFactory(() => GetPostsCubit(di()));
  di.registerFactory(() => AddDeleteUpdatePostCubit(
        addPostUseCase: di(),
        deletePostUseCase: di(),
        updatePostUseCase: di(),
      ));
  di.registerFactory(() => SetThemeCubit(di()));

  //use_case
  di.registerLazySingleton(() => GetAllPostsUseCase(di()));
  di.registerLazySingleton(() => AddPostUseCase(di()));
  di.registerLazySingleton(() => DeletePostUseCase(di()));
  di.registerLazySingleton(() => UpdatePostUseCase(di()));
  di.registerLazySingleton(() => SetThemeUseCase(di()));

  //repo
  di.registerLazySingleton<PostsRepo>(() => PostsRepoImpl(
        networkInfo: di(),
        remoteDataSource: di(),
        localDataSource: di(),
      ));

  //data_sources
  di.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSourceImpl(di()));
  di.registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSourceImpl(di()));
}
