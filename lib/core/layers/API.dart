import 'package:dio/dio.dart';

class API {
  static Dio _instance;

  static getInstance() {
    if (_instance == null) {
      var request = BaseOptions(baseUrl: "https://channab.com");
      _instance = Dio(request);
    }

    return _instance;
  }
}
