import 'package:clean_architechture_project_three/feature/posts/domain/entities/post.dart';
import 'package:clean_architechture_project_three/feature/posts/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);
  Future<List<Post>> call() {
    return repository.getPosts();
  }
}