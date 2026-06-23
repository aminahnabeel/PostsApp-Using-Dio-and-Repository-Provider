import '../models/post_models.dart';
import '../services/api_service.dart';

class PostRepository {
  final ApiService apiService;

  PostRepository(this.apiService);

  Future<List<PostModel>> fetchPosts() async {
    final response = await apiService.getPosts();

    return response
        .map<PostModel>(
          (e) => PostModel.fromJson(e),
        )
        .toList();
  }
}