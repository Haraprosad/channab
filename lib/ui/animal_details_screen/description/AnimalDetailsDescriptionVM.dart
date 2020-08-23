import 'dart:async';
import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/View_Particular_Animal.dart';
import 'package:channab/core/model/AnimalModel.dart';
import 'package:dio/dio.dart';

class AnimalDetailsDescriptionVM {
  static Dio dio;

  StreamController<MyAnimalModel> stream;
  MyAnimalModel animalModel;
  var productID = 0;

  AnimalDetailsDescriptionVM(String token) {
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

  void dispose() {
    stream.close();
  }
}
