import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/post_repository.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository repository;

  PostCubit(this.repository)
      : super(PostInitial());

  Future<void> getPosts() async {
    

      final posts =
          await repository.fetchPosts();

      emit(PostLoaded(posts));
    } 
  }
