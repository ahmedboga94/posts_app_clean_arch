import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/add_delete_update_post/add_delete_update_post_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/widgets/custom_txt_form_field.dart';

class AddOrUpdateView extends StatefulWidget {
  final bool isUpdate;
  final PostEntity? post;
  const AddOrUpdateView({super.key, required this.isUpdate, this.post});

  @override
  State<AddOrUpdateView> createState() => _AddOrUpdateViewState();
}

class _AddOrUpdateViewState extends State<AddOrUpdateView> {
  String title = "";
  String body = "";
  final _formKey = GlobalKey<FormState>();

  vaildationMethod() {
    if (_formKey.currentState!.validate()) {
      if (widget.isUpdate) {
        BlocProvider.of<AddDeleteUpdatePostCubit>(context)
            .updatePost(widget.post!);
      } else {
        final addPost = PostEntity(id: 0, title: title, body: body);
        BlocProvider.of<AddDeleteUpdatePostCubit>(context).addPost(addPost);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CutomTxtFormField(
                  vaildTxt: "Title can't be empty",
                  label: "Enter Post Title",
                  intialVal: widget.isUpdate ? widget.post!.title : null,
                  onChanged: (value) => title = value),
              const SizedBox(height: 22),
              CutomTxtFormField(
                  vaildTxt: "Body can't be empty",
                  label: "Enter Post Body",
                  intialVal: widget.isUpdate ? widget.post!.body : null,
                  onChanged: (value) => body = value,
                  maxlines: 7),
              const SizedBox(height: 22),
              ElevatedButton.icon(
                  onPressed: vaildationMethod,
                  icon: Icon(widget.isUpdate ? Icons.edit : Icons.add),
                  label: Text(widget.isUpdate ? "Update Post" : "Add Post"))
            ],
          ),
        ),
      ),
    );
  }
}
