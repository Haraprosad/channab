import 'dart:io';

import 'package:dio/dio.dart';

class PopupApiLayer {
  static deactivateAnimal(Dio dio, id) async {
    var response =
        await dio.get("/api/deactivate_animal/", queryParameters: {"id": id});
    return response;
  }

  static postSaveGallery(Dio dio, File mainImage, int id) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": id,
      "main_image":
          await MultipartFile.fromFile(mainImage.path, filename: "cow"),
    });

    //gallery_popup
    await dio.post("/api/gallery_popup/", data: formData);
  }

  static postAnimalMilking(Dio dio, File mainImage, int animalParticularId,
      int morningTime, int eveningTime) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": animalParticularId,
      "morning_time": morningTime,
      "evening_time": eveningTime,
    });

    //gallery_popup
    await dio.post("/api/milking_popup/", data: formData);
  }

  static postDescription(Dio dio, File mainImage, int id, String des) async {
    FormData formData = new FormData.fromMap({
      "animal_particular_id": id,
      "description": des,
    });

    //gallery_popup
    await dio.post("/api/description_popup/", data: formData);
  }
}
