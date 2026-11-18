import 'package:clean_architechture_project_three/core/cosntants/api_constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
