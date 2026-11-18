import 'package:clean_architechture_project_three/core/cosntants/api_constants.dart';
import 'package:clean_architechture_project_three/feature/photos/data/models/photo_models.dart';
import 'package:dio/dio.dart';

class PhotoRemoteDataSource {
  final Dio dio;

  PhotoRemoteDataSource(this.dio);

  Future<List<PhotoModels>> getPhotos() async {
    try {
      final response = await dio.get(ApiConstants.photos);
      final List data = response.data;
      return data.map((json) => PhotoModels.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Something went wrong');
    }
  }
}
