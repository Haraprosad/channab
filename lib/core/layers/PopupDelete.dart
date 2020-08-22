import 'package:dio/dio.dart';

class PopupDeleteApiLayer {
  static healthDelete(Dio dio, id) async {
    var response =
        await dio.get("/api/health_delete/", queryParameters: {"title_id": id});
    return response;
  }

  static milkDelete(Dio dio, id) async {
    var response =
        await dio.get("/api/milk_delete/", queryParameters: {"milk_id": id});
    return response;
  }

  static deleteDes(Dio dio, id) async {
    var response = await dio.get("/api/description_delete/",
        queryParameters: {"delete_desc_id": id});
    return response;
  }

  static imageDelete(Dio dio, id) async {
    var response =
        await dio.get("/api/image_delete/", queryParameters: {"image_id": id});
    return response;
  }

  static deleteMaleParent(Dio dio, id) async {
    var response = await dio.get("/api/male_parent_delete/",
        queryParameters: {"delete_male_id": id});
    return response;
  }

  static deleteFemaleParent(Dio dio, id) async {
    var response = await dio.get("/api/female_parent_delete/",
        queryParameters: {"delete_female_id": id});
    return response;
  }

  static deleteChild(Dio dio, id) async {
    var response = await dio
        .get("/api/child_delete/", queryParameters: {"delete_child_id": id});
    return response;
  }
}
