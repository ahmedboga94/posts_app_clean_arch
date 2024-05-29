import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/presentation/views/add_update_post_view.dart';
import 'package:posts_app_clean/features/posts/presentation/widgets/delete_post_confirmation.dart';

class PostDetailsView extends StatelessWidget {
  final PostEntity post;
  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(post.title, style: context.textTheme.headlineMedium),
            const Divider(thickness: 2, height: 50),
            Text(post.body, style: context.textTheme.titleLarge),
            const Divider(thickness: 2, height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                AddUpdatePostView(isUpdate: true, post: post))),
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Post")),
                ElevatedButton.icon(
                    onPressed: () => deletePostConfirmation(context),
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete Post")),
              ],
            )
          ],
        ),
      ),
    );
  }

  void deletePostConfirmation(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DeletePostConfirmationWidget(post: post);
        });
  }
}
