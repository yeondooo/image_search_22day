import 'dart:convert';

import 'package:image_search_22day/data/dto/pixabay_result_dto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<PixabayResultDto> getImages(String query) async {
    final url =
        'https://pixabay.com/api/?key=37971457-4bad1cc05aa70353cb5a9d52e&q=$query&image_type=photo';
    final http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonString = jsonDecode(response.body);
    return PixabayResultDto.fromJson(jsonString);
  }
}
