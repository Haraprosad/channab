import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/log_in_repos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInVM {
  static Dio dio;

  LogInVM() {
    dio = API.getInstance();
//    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b";
  }

  getLogInResponse(
      String mobileNumber, String password, BuildContext context) async {
    var logInResponse =
        await LogInRepos.requestLogIn(dio, mobileNumber, password);
    print(logInResponse);
    var data = json.decode(logInResponse.data);

    //save log in token
    addStringToSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('logInToken', data.token);
    }

    if (data.status.toString() == "200") {
      addStringToSF();
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => AnimalListUI()),
//      );
    }

    //testing messages
    print(data.message);
    print(data.status);
    print(data.token); //
    return logInResponse;
  }
}
