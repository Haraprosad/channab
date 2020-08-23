import 'dart:async';
import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/log_in_repos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInVM {
  static Dio dio;

  StreamController<String> loginSatus;

  LogInVM() {
    dio = API.getInstance();
    dio.options.headers["x-api-key"] =
        "9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b";

    loginSatus = StreamController();
  }

  getLogInResponse(
      String mobileNumber, String password, BuildContext context) async {
    var logInResponse =
        await LogInRepos.requestLogIn(dio, mobileNumber, password);
    print(logInResponse);

    var data = json.decode(logInResponse.data);

    if (data["status"].toString() == "200") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('logInToken', data['token']);
    }

    loginSatus.add(data['token']);

    return data;
  }

  // 7528819272
  // 1234567

  dispose() {
    loginSatus.close();
  }
}


class LoginStatus {}
