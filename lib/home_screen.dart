import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_cubit.dart';
import '../cubit/post_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {

          if (state is PostLoading) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {

                final post =
                    state.posts[index];

                return Card(
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(
                      child: Text(
                        post.id.toString(),
                      ),
                    ),
                  ),
                );
              },
            );
          }

         

          return const SizedBox();
        },
      ),
    );
  }
}