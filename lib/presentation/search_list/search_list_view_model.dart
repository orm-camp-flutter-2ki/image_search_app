import 'package:flutter/material.dart';
import 'package:image_search_app_1/data/repository/photo_repository.dart';

import '../../data/model/photo.dart';
import 'search_list_state.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  SearchListViewModel({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  SearchListState _state = const SearchListState();

  SearchListState get state => _state;

  void onSearch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      photos: await _photoRepository.getPhotos(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
