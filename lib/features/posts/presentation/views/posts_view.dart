import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:posts_app_clean/features/posts/presentation/cubit/get_posts/get_posts_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/views/add_update_post_view.dart';
import 'package:posts_app_clean/features/posts/presentation/views/theme_switch_btn.dart';
import 'package:posts_app_clean/features/posts/presentation/widgets/error_mesg_widget.dart';
import 'package:posts_app_clean/features/posts/presentation/widgets/get_all_posts_weidget.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"), actions: const [
        ThemeToggle(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const AddUpdatePostView(isUpdate: false))),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetPostsCubit, GetPostsState>(
          builder: (context, state) {
            if (state is GetPostsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetPostsSuccess) {
              return RefreshIndicator(
                  onRefresh: () =>
                      BlocProvider.of<GetPostsCubit>(context).getAllPosts(),
                  child: GetAllPostsWidget(posts: state.posts));
            } else if (state is GetPostsFailure) {
              return ErrorMsgWidget(msg: state.errorMessage);
            } else {
              return const Text("Something went wrong");
            }
          },
        ),
      ),
    );
  }
}
