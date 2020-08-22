import 'dart:async';
import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/View_Particular_Animal.dart';
import 'package:channab/core/model/AnimalModel.dart';
import 'package:dio/dio.dart';

class AnimalDetailsVM {
  static Dio dio;

  StreamController<MyAnimalModel> stream;

  AnimalDetailsVM(String token) {
    dio = API.getInstance();
    dio.options.headers["x-api-key"] = token;
    stream = StreamController<MyAnimalModel>.broadcast();
  }

  void getAllData(int id) {
    var response = ViewParticularAnimal.getParticularAnimal(dio, id);
    var model = MyAnimalModel.fromJson(json.decode(response));
    stream.add(model);
  }

  void dispose() {
    stream.close();
  }
}
