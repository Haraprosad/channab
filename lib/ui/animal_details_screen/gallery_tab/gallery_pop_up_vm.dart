import 'dart:io';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/Popup_API_Layers.dart';
import 'package:dio/dio.dart';

class GalleryPopUpVM {
  static Dio dio;

  GalleryPopUpVM() {
    dio = API.getInstance();
    dio.options.headers["token"] = "50a67c112aff02f32cfefd52c242933b727d28bd";
  }

  getGalleryPopResponse(File mainImage, String id) async {
    var galleryPopResponse =
        await PopupApiLayer.postSaveGallery(dio, mainImage, id);
    print(galleryPopResponse);
    return galleryPopResponse;
  }
}
