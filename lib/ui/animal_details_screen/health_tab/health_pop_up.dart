import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/material.dart';

class HealthPopUp extends StatefulWidget {
  @override
  _HealthPopUpState createState() => _HealthPopUpState();
}

class _HealthPopUpState extends State<HealthPopUp> {
  String healthTital;
  String healthCost;
  String healthContant;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Health",
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
              "Health Tital",
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
                onChanged: (v) {
                  //todo
                  healthTital = v;
                },
                decoration: new InputDecoration(
                  hintText: "Health tital",
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
              "Health Cost",
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
                onChanged: (v) {
                  //todo
                  healthCost = v;
                },
                decoration: new InputDecoration(
                  hintText: "Health Cost",
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
              "Health Contant",
              style: TextStyle(
                fontSize: 18,
                fontFamily: fontFamilyRobotoMedium,
              ),
            ),

            SizedBox(
              height: consMedPadH,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (v) {
                  //todo
                  healthContant = v;
                },
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20, top: 5),
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
                    //todo
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
      ),
    );
  }
}
