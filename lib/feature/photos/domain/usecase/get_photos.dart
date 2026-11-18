import 'package:clean_architechture_project_three/feature/photos/domain/entities/photo.dart';
import 'package:clean_architechture_project_three/feature/photos/domain/repository/photos_repository.dart';

class GetPhotos {
  final PhotosRepository repository;

  GetPhotos(this.repository);

  Future<List<Photo>> call(){
    return repository.getPhotos();
  }
}