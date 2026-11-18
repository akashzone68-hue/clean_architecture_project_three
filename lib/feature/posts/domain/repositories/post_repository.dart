import 'package:clean_architechture_project_three/feature/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}