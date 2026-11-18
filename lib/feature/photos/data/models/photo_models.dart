import 'package:clean_architechture_project_three/feature/photos/domain/entities/photo.dart';

class PhotoModels extends Photo {
  PhotoModels({
    required super.albumId, 
    required super.id, 
    required super.title, 
    required super.url, 
    required super.thumbnailUrl
  });

  factory PhotoModels.fromJson(Map<String, dynamic> json){
    return PhotoModels(
      albumId: json['albumId'], 
      id: json['id'], 
      title: json['title'], 
      url: json['url'], 
      thumbnailUrl: json['thumbnailUrl']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}