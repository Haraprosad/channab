import 'dart:io';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/farm_animal_info_up_repos.dart';
import 'package:dio/dio.dart';

class AnimalInfoUpVM {
  static Dio dio;

  AnimalInfoUpVM(token) {
    dio = API.getInstance();
//    dio.options.headers["token"] = "50a67c112aff02f32cfefd52c242933b727d28bd";
    dio.options.headers["token"] = token;
  }

  getInfoUpResponse(String animalTag, String category, String gender,
      DateTime age, File mainImage) async {
    var infoUpResponse = await FarmAnimalInfoUpRepos.requestInfoUp(
        dio, animalTag, category, gender, age, mainImage);
    print(infoUpResponse);
    return infoUpResponse;
  }
}
