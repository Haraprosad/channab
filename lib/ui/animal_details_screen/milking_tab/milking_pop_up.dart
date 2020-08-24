import 'dart:convert';

import 'package:channab/core/layers/API.dart';
import 'package:channab/core/layers/Popup_API_Layers.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/material.dart';

class MilkingPopUp extends StatefulWidget {
  final String id;
  final String token;

  MilkingPopUp(this.id, this.token);

  @override
  _MilkingPopUpState createState() => _MilkingPopUpState();
}

class _MilkingPopUpState extends State<MilkingPopUp> {
  String morningMilk;
  String eveningMilk;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Milk",
            style: TextStyle(
              fontSize: 18,
              color: buttonBackColor,
              fontFamily: fontFamilyMontserratBold,
            ),
          ),

          SizedBox(
            height: consMedPadH,
          ),
          Text(
            "Morning Milk",
            style: TextStyle(
              fontSize: 18,
              fontFamily: fontFamilyRobotoMedium,
            ),
          ),

          SizedBox(
            height: consMedPadH,
          ),
          Container(
            height: 45.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (v) {
                //todo
                morningMilk = v;
              },
              decoration: new InputDecoration(
                hintText: "Morning milk",
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                hintStyle: hintTextStyle,
                border: new OutlineInputBorder(
                  borderSide: BorderSide(color: dividerColor),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Evening Milk",
            style: TextStyle(
              fontSize: 18,
              fontFamily: fontFamilyRobotoMedium,
            ),
          ),

          SizedBox(
            height: consMedPadH,
          ),
          Container(
            height: 45.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (v) {
                //todo
                eveningMilk = v;
              },
              decoration: new InputDecoration(
                hintText: "Evening milk",
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                hintStyle: hintTextStyle,
                border: new OutlineInputBorder(
                  borderSide: BorderSide(color: dividerColor),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: consMedPadH * 1.5,
          ),
          Center(
            child: Container(
              width: 220,
              height: 45,
              child: RaisedButton(
                color: buttonBackColor,
                child: Text(
                  "Save Information",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: fontFamilyRobotoMedium),
                ),
                onPressed: () {
                  sendRequest();
                },
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          //todo end
        ],
      ),
    );
  }

  void sendRequest() async {
    var dio = API.getInstance();
    dio.options.headers["token"] = widget.token;

    var res = PopupApiLayer.postAnimalMilking(
        dio, widget.id, morningMilk, eveningMilk);

    var data = json.decode(res.data);
    if (data["status"].toString() == "200") {
      Navigator.of(context).pop();
    }
  }
}
