import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/presentation/views/post_details_view.dart';

class GetAllPostsWidget extends StatelessWidget {
  final List<PostEntity> posts;

  const GetAllPostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Posts", style: context.textTheme.headlineSmall),
        Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Text("${posts[index].id}",
                          style: context.textTheme.titleLarge),
                      title: Text(posts[index].title,
                          style: context.textTheme.titleLarge),
                      subtitle: Text(posts[index].body,
                          style: context.textTheme.bodyMedium),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PostDetailsView(post: posts[index]))),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
