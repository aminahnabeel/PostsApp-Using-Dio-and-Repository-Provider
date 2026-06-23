import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/post_cubit.dart';
import 'repositories/post_repository.dart';
import 'services/api_service.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepository(
        ApiService(),
      ),
      child: BlocProvider(
        create: (context) => PostCubit(
          context.read<PostRepository>(),
        )..getPosts(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Posts App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}