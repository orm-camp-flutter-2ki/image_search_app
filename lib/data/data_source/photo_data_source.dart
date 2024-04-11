import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/photo_result_dto.dart';

class PhotoDataSource {
  final _baseUrl = 'https://pixabay.com/api/';

  Future<PhotoResultDto> getPhotoResult(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));

    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }
}
