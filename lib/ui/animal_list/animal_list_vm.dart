import 'dart:async';
import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/animal_list_repos.dart';
import 'package:channab/core/model/animal_list_model.dart';
import 'package:dio/dio.dart';

class AnimalListVM {
  static Dio dio;

  StreamController<AnimalListModel> getStream;

  AnimalListVM(String token) {
    dio = API.getInstance();
    dio.options.headers["token"] = token;
    getStream = StreamController<AnimalListModel>.broadcast();
  }

  void getAllData() async {
    var response = await AnimalListRepos.getAnimalList(dio);
    var model = AnimalListModel.fromJson(json.decode(response.data));
    getStream.add(model);
  }

  void dispose() {
    getStream.close();
  }
}
