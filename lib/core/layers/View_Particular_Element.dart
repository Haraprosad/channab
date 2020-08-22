import 'package:dio/dio.dart';

class ViewParticularElement {
  static getParticularElement(Dio dio, id) async {
    var response = await dio.get("/api/view_particular_element",
        queryParameters: {"product_id": id});
    return response;
  }
}
