import 'dart:io';

import 'package:dio/dio.dart';

class FarmAnimalInfoUpRepos {
  static requestInfoUp(Dio dio, String animalTag, String category,
      String gender, DateTime age, File mainImage) async {
    FormData formData = new FormData.fromMap({
      "animal_tag": animalTag,
      "category": category,
      "gender": gender,
      "age": age,
      "main_image":
          await MultipartFile.fromFile(mainImage.path, filename: "cow"),
      "animal_type": "Dry",
      //todo
    });
    try {
      var response = await dio.post("/api/live_animal_Add/", data: formData);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
