import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/add_delete_update_post/add_delete_update_post_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/widgets/add_or_update_view.dart';

class AddUpdatePostView extends StatelessWidget {
  final bool isUpdate;
  final PostEntity? post;

  const AddUpdatePostView({super.key, required this.isUpdate, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isUpdate ? "Edit Post" : "Add Post")),
      body: Center(
        child: BlocConsumer<AddDeleteUpdatePostCubit, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is AddDeleteUpdatePostSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.posts)));
              Navigator.pop(context);
            } else if (state is AddDeleteUpdatePostFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is AddDeleteUpdatePostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return AddOrUpdateView(
                isUpdate: isUpdate,
                post: isUpdate ? post : null,
              );
            }
          },
        ),
      ),
    );
  }
}
