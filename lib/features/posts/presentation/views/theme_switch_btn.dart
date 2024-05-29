import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/get_posts/get_posts_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/theme/set_theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetThemeCubit, SetThemeState>(
      builder: (context, state) {
        return TextButton.icon(
            onPressed: () {
              BlocProvider.of<SetThemeCubit>(context).setTheme(
                  state is LightThemeState
                      ? ThemeDeviceState.darkTheme
                      : ThemeDeviceState.lightTheme);
            },
            icon: Icon(state is DarkThemeState ? Icons.dark_mode : Icons.sunny),
            label: Text(state is DarkThemeState ? "Dark" : "Light"));
      },
      listener: (BuildContext context, SetThemeState state) {
        state is LightThemeState
            ? BlocProvider.of<GetPostsCubit>(context).getAllPosts()
            : BlocProvider.of<GetPostsCubit>(context).getAllPosts();
      },
    );
  }
}
