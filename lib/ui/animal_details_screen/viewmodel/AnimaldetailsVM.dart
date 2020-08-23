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

  AnimalDetailsVM(String token) {
    dio = API.getInstance();
    dio.options.headers["token"] = token;
    stream = StreamController<MyAnimalModel>.broadcast();
  }

  void getAllData(int id) async {
    productID = id;
    var response = await ViewParticularAnimal.getParticularAnimal(dio, id);
    var model = MyAnimalModel.fromJson(json.decode(response.data));
    stream.add(model);
    animalModel = model;
  }

  Future<MyAnimalModel> getGalleryData() async {
    if (animalModel == null) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getMilkingData() async {
    if (animalModel == null) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getFamilyData() async {
    if (animalModel == null) {
      var response =
          await ViewParticularAnimal.getParticularAnimal(dio, productID);
      var model = MyAnimalModel.fromJson(json.decode(response.data));
      animalModel = model;
      return animalModel;
    }
    return animalModel;
  }

  Future<MyAnimalModel> getHealthData() async {
    if (animalModel == null) {
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
