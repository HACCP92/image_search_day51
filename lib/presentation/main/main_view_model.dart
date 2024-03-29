import 'package:flutter/material.dart';
import 'package:image_search_day51/domain/use_case/get_top_five_most_viewd_use_case.dart';
import 'package:image_search_day51/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewdImagesUseCase _getTopFiveMostViewdImagesUseCase;

  MainViewModel(this._getTopFiveMostViewdImagesUseCase);
  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        photos: await _getTopFiveMostViewdImagesUseCase.execute(query),
        isLoading: false);
    notifyListeners();
  }
}

class GetTopFiveMostViewdImagesUseCase {
  execute(String query) {}
}
