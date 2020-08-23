import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/material.dart';

class FamilyPopUp extends StatefulWidget {
  final String id;
  final String token;

  FamilyPopUp(this.id, this.token);

  @override
  _FamilyPopUpState createState() => _FamilyPopUpState();
}

class _FamilyPopUpState extends State<FamilyPopUp> {
  String maleParent;
  String femaleParent;

  String selectedMarktCategoryName = "No Market Selected";
  List<String> categoriesName = [
    "No Market Selected",
    "Ladakh Market",
    "Jhany Market"
  ];

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
              "Add Family",
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
              "Male Parent",
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
                  maleParent = v;
                },
                decoration: new InputDecoration(
                  hintText: "GF105",
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
              "Female Parent",
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
                  femaleParent = v;
                },
                decoration: new InputDecoration(
                  hintText: "GF106",
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
              "Select Child",
              style: TextStyle(
                fontSize: 18,
                fontFamily: fontFamilyRobotoMedium,
              ),
            ),

            SizedBox(
              height: consMedPadH,
            ),
            //market category***********
            Container(
              height: 45.0,
              padding: EdgeInsets.only(left: consMedPadH),
              decoration: BoxDecoration(
                  color: lightBlueColor,
                  border: Border.all(
                    color: lightBlueColor,
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: lightBlueColor,
                  isExpanded: true,
                  value: selectedMarktCategoryName,
                  onChanged: (String newValue) {
                    setState(() {
                      selectedMarktCategoryName = newValue;
                    });
                  },
                  hint: Text(
                    'Select Category',
                    style: hintTextStyle,
                  ),
                  icon: Icon(
                    // Add this
                    Icons.arrow_drop_down, // Add this
                    color: channabBackgroundColor,
                    size: 40, // Add this
                  ),
                  items: categoriesName
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: channabBackgroundColor),
                      ),
                    );
                  }).toList(),
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
              height: 20,
            ),
            Center(
              child: Container(
                width: 180,
                height: 45,
                child: RaisedButton(
                  color: buttonBackColor,
                  child: Text(
                    "Add Animal",
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
      ),
    );
  }

  void sendRequest() async {
    //no api provided
//    var dio = API.getInstance();
//    dio.options.headers["token"] = widget.token;
//
//    var res = PopupApiLayer.(
//        dio, widget.id, morningMilk, eveningMilk);
//
//    var data = json.decode(res.data);
//    if (data["status"].toString() == "200") {
//      Navigator.of(context).pop();
//    }
  }
}
