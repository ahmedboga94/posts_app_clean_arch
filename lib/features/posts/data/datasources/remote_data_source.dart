import 'package:dartz/dartz.dart';
import 'package:posts_app_clean/core/api_service.dart';
import 'package:posts_app_clean/features/posts/data/models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel postModel);
  Future<Unit> deletePost(PostModel postModel);
  Future<Unit> updatePost(PostModel postModel);
}

class PostsRemoteDataSourceImpl extends PostsRemoteDataSource {
  ApiService apiService;
  PostsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<PostModel>> getAllPosts() async {
    List data = await apiService.get(endPoint: "posts");

    List<PostModel> postsModel = data
        .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
        .toList();
    return postsModel;
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    await apiService.post(endPoint: "posts", body: body);
    return Future.value(unit);
  }

  @override
  Future<Unit> deletePost(PostModel postModel) async {
    await apiService.delete(endPoint: "posts/${postModel.id}");
    return Future.value(unit);
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final body = {
      "id": postModel.id,
      "title": postModel.title,
      "body": postModel.body,
    };

    await apiService.post(endPoint: "posts", body: body);
    return Future.value(unit);
  }
}
