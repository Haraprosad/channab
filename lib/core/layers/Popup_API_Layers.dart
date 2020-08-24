import 'dart:io';

import 'package:dio/dio.dart';

class PopupApiLayer {
  static deactivateAnimal(Dio dio, id) async {
    var response =
        await dio.get("/api/deactivate_animal/", queryParameters: {"id": id});
    return response;
  }

  static postSaveGallery(Dio dio, File mainImage, String id) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": id,
      "main_image":
          await MultipartFile.fromFile(mainImage.path, filename: "cow"),
    });

    //gallery_popup
    var res = await dio.post("/api/gallery_popup/", data: formData);
    return res;
  }

  static postAnimalMilking(Dio dio, String animalParticularId,
      String morningTime, String eveningTime) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": animalParticularId,
      "morning_time": morningTime,
      "evening_time": eveningTime,
    });

    //gallery_popup
    var res = await dio.post("/api/milking_popup/", data: formData);
    return res;
  }

  static postDescription(Dio dio, int id, String des) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": id,
      "description": des,
    });

    //gallery_popup
    var res = await dio.post("/api/description_popup/", data: formData);
    print(res);
    return res;
  }
}
