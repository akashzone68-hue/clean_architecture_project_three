import 'package:clean_architechture_project_three/feature/photos/data/datasources/photo_remote_data_source.dart';
import 'package:clean_architechture_project_three/feature/photos/domain/entities/photo.dart';
import 'package:clean_architechture_project_three/feature/photos/domain/repository/photos_repository.dart';

class PhotoRepositoryImpl implements PhotosRepository{
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Photo>> getPhotos() async{
     return await remoteDataSource.getPhotos();
  }
}