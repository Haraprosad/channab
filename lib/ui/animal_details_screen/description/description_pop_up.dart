import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DescriptionPopUp extends StatefulWidget {
  @override
  _DescriptionPopUpState createState() => _DescriptionPopUpState();
}

class _DescriptionPopUpState extends State<DescriptionPopUp> {
  String description;
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
            "Add Description",
            style: TextStyle(
              fontSize: 18,
              color: buttonBackColor,
              fontFamily: fontFamilyMontserratBold,
            ),
          ),

          SizedBox(
            height: consMedPadH,
          ),
          DottedBorder(
            color: buttonBackColor,
            dashPattern: [6, 2, 6, 2],
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (v) {
                  description = v;
                },
                decoration: new InputDecoration(
                  hintText: "Write a description...",
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 5, bottom: 10, right: 5),
                  hintStyle: hintTextStyle,
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
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
    );
  }
}
