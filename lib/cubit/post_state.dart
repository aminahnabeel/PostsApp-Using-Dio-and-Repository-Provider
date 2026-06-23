import '../models/post_models.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> posts;

  PostLoaded(this.posts);
}

