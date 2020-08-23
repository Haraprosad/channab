import 'package:dio/dio.dart';

class ViewParticularAnimal {
  static getParticularAnimal(Dio dio, id) async {
    var response = await dio.get("/api/view_particular_element/",
        queryParameters: {"product_id": id});
    return response;
  }
}
