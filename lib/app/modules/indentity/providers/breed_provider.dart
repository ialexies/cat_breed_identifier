import 'dart:convert';

import 'package:cat_breed_identifier/app/modules/indentity/breed_model.dart';
import 'package:get/get.dart';

class BreedProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Breed.fromJson(map);
      if (map is List) return map.map((item) => Breed.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://api.thecatapi.com/';
  }

  List<Breed> breedsFromJson(str) {
    var a = str.map((x) => Breed.fromJson(x));
    return List<Breed>.from(a);
  }

  Future<List<Breed>> fetchBreeds() async {
    final response = await get('https://api.thecatapi.com/v1/breeds');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      var b = response.body;
      var a = breedsFromJson(response.body);
      return a;
    }
  }

  Future<Response<Breed>> postBreed(Breed breed) async =>
      await post('breed', breed);
  Future<Response> deleteBreed(int id) async => await delete('breed/$id');
}
