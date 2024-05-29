import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/core/app_failures.dart';
import 'package:posts_app_clean/core/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';

abstract class PostsLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postsModel);
  ThemeDeviceState setTheme(ThemeDeviceState deviceTheme);
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cachePosts(List<PostModel> postsModel) {
    var postModelToJson = postsModel
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();

    sharedPreferences.setString(
        AppStrings.cachedPosts, jsonEncode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedPosts);

    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> postModelFromJson = decodeJsonData
          .map<PostModel>((jsonPostMpdel) => PostModel.fromJson(jsonPostMpdel))
          .toList();
      return Future.value(postModelFromJson);
    } else {
      throw EmptyCasheFailure(failureMessage: "Error in cached Data");
    }
  }

  @override
  ThemeDeviceState setTheme(ThemeDeviceState deviceTheme) {
    if (deviceTheme == ThemeDeviceState.lightTheme) {
      sharedPreferences.setString(AppStrings.initTheme, AppStrings.lightTheme);
      debugPrint(sharedPreferences.getString(AppStrings.initTheme));
      return ThemeDeviceState.lightTheme;
    } else {
      sharedPreferences.setString(AppStrings.initTheme, AppStrings.darkTheme);

      debugPrint(sharedPreferences.getString(AppStrings.initTheme));

      return ThemeDeviceState.darkTheme;
    }
  }
}
