import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/core/app_theme.dart';
import 'package:posts_app_clean/core/di.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/add_delete_update_post/add_delete_update_post_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/get_posts/get_posts_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/cubit/theme/set_theme_cubit.dart';
import 'package:posts_app_clean/features/posts/presentation/views/posts_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<GetPostsCubit>()..getAllPosts()),
        BlocProvider(create: (_) => di<AddDeleteUpdatePostCubit>()),
        BlocProvider(create: (_) => di<SetThemeCubit>()..getTheme())
      ],
      child: BlocBuilder<SetThemeCubit, SetThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              title: "Posts",
              themeMode:
                  state is LightThemeState ? ThemeMode.light : ThemeMode.dark,
              home: const PostsView());
        },
      ),
    );
  }
}
