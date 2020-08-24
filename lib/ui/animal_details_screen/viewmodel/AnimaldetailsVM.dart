import 'dart:async';
import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/View_Particular_Animal.dart';
import 'package:channab/core/model/AnimalModel.dart';
import 'package:dio/dio.dart';

class AnimalDetailsVM {
  static Dio dio;

  StreamController<MyAnimalModel> stream;
  MyAnimalModel animalModel;
  var productID = 0;
  bool isCalled = false;

  AnimalDetailsVM(String token) {
    dio = API.getInstance();
//    String token1 = "50a67c112aff02f32cfefd52c242933b727d28bd";
    dio.options.headers["token"] = token;
    stream = StreamController<MyAnimalModel>.broadcast();
  }

  void getAllData(int id, token) async {
    productID = id;
    isCalled = true;
    var response = await ViewParticularAnimal.getParticularAnimal(dio, id);
    var decoded = json.decode(response.data);

    var model = MyAnimalModel.fromJson(decoded);
    print(response);
    stream.add(model);
    animalModel = model;
    isCalled = false;
  }

  void requestUpdate() async {
    var response =
        await ViewParticularAnimal.getParticularAnimal(dio, productID);
    var decoded = json.decode(response.data);

    var model = MyAnimalModel.fromJson(decoded);
    print(response);
    stream.add(model);
  }

  Future<MyAnimalModel> getGalleryData() async {
    if (animalModel == null && !isCalled) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getMilkingData() async {
    if (animalModel == null && !isCalled) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var decoded = json.decode(response.data);

      var model = MyAnimalModel.fromJson(decoded);

      animalModel = model;

      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getFamilyData() async {
    if (animalModel == null && !isCalled) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getHealthData() async {
    if (animalModel == null && !isCalled) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  void dispose() {
    stream.close();
  }
}
