import 'package:clean_architechture_project_three/feature/photos/domain/entities/photo.dart';

abstract class PhotosRepository {
  Future<List<Photo>> getPhotos();
}