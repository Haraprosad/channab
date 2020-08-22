import 'package:dio/dio.dart';

class LogInRepos {
  static requestLogIn(Dio dio, String mobileNumber, String password) async {
    FormData formData = new FormData.fromMap({
      "mobile_number": mobileNumber,
      "password": password,
    });
    try {
      var response = await dio.post("/api/login/", data: formData);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
