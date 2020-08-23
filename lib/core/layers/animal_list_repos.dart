import 'package:dio/dio.dart';

class AnimalListRepos {
  static getAnimalList(Dio dio) async {
    try {
      var response = await dio.get("/api/livestock_listing/");
      return response;
    } catch (e) {
      print(e);
    }
  }
}
