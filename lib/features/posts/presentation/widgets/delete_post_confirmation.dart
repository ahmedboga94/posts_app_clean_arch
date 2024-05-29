import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/add_delete_update_post/add_delete_update_post_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/views/posts_view.dart';

class DeletePostConfirmationWidget extends StatelessWidget {
  const DeletePostConfirmationWidget({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDeleteUpdatePostCubit, AddDeleteUpdatePostState>(
      listener: (context, state) {
        if (state is AddDeleteUpdatePostSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.posts)));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PostsView()),
              (route) => false);
        } else if (state is AddDeleteUpdatePostFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is AddDeleteUpdatePostLoading) {
          return const AlertDialog(
              title: Center(child: CircularProgressIndicator()));
        } else {
          return AlertDialog(
            title: const Text("Are you sure to delete this post?"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No")),
              ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<AddDeleteUpdatePostCubit>(context)
                          .deletePost(post),
                  child: const Text("Yes")),
            ],
          );
        }
      },
    );
  }
}
