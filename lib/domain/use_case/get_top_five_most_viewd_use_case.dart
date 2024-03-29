import 'package:image_search_day51/domain/model/photo.dart';
import 'package:image_search_day51/domain/repository/photo_repository.dart';

class GetTopTwentyMostViewedImagesUseCase {
  final PhotoRepository _repository;

  GetTopTwentyMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> execute(String query) async {
    final photos = await _repository.getPhotos(query);

    photos.sort((a, b) => -a.views.compareTo(b.views));
    return photos.take(20).toList();
  }
}
