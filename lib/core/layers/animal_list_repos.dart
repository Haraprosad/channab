import 'package:dio/dio.dart';

class AnimalListRepos {
  static getAnimalList(Dio dio) async {
    var response = await dio.get("/api/livestock_listing/");
    return response;
  }
}
