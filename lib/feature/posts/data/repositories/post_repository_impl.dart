import 'package:clean_architechture_project_three/feature/posts/data/datasource/post_remote_data_source.dart';
import 'package:clean_architechture_project_three/feature/posts/domain/entities/post.dart';
import 'package:clean_architechture_project_three/feature/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts();
  }
}
