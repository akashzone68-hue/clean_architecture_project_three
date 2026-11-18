import 'package:clean_architechture_project_three/feature/photos/data/datasources/photo_remote_data_source.dart';
import 'package:clean_architechture_project_three/feature/photos/domain/entities/photo.dart';
import 'package:clean_architechture_project_three/feature/photos/domain/usecase/get_photos.dart';
import 'package:clean_architechture_project_three/feature/photos/data/repositories/Photo_repository_impl.dart';
import 'package:flutter/material.dart';
import '../../../../core/network/dio_client.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late final GetPhotos getPhotos;

  // List<Photo> photos = [];
  List<Photo> photos = [];

  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    // Dependency initialization
    final dio = DioClient().dio;

    final remoteDataSource = PhotoRemoteDataSource(dio);

    final repository = PhotoRepositoryImpl(remoteDataSource);

    getPhotos = GetPhotos(repository);

    fetchphotos();
  }

  Future<void> fetchphotos() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await getPhotos();

      if (!mounted) return;

      setState(() {
        photos = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('photos Application'),
        actions: [
          IconButton(onPressed: fetchphotos, icon: const Icon(Icons.refresh)),
        ],
        backgroundColor: Colors.black,
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorMessage!),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: fetchphotos, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (photos.isEmpty) {
      return const Center(child: Text('No photos available'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  photo.url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;

                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, size: 40),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  photo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text('Photo ID: ${photo.id}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
