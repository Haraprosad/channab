import 'dart:convert';

import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/image_picker_cropper.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/farm_animals_info_upload/animalInfoUpVM.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class FarmAnimalListUpUI extends StatefulWidget {
  final String token;

  FarmAnimalListUpUI(this.token);

  @override
  _FarmAnimalListUpUIState createState() => _FarmAnimalListUpUIState();
}

class _FarmAnimalListUpUIState extends State<FarmAnimalListUpUI> {
  AnimalInfoUpVM _animalInfoUpVM;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var imgProfile;
  var imgFile;
  String dateOfBirth = "DOB";

  //madis and category
  List<String> categoriesName = [
    "Cow",
    "Buffalo",
    "Goat",
    "Sheep",
    "Horse",
    "Others"
  ];
  String animalTag;
  String selectedCategoryName = "Cow";
  List<String> animalGender = ["Male", "Female"];
  String selectedGender = "Male";

  //date
  DateTime selectedDate;

  getSnackBar(String message) {
    return SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }

  @override
  void initState() {
    _animalInfoUpVM = AnimalInfoUpVM(widget.token);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("set state call ");
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: buttonBackColor,
        leading: Icon(Icons.arrow_back),
        title: Text("Farm Animals"),
        actions: [
          Image.asset("assets/images/frame2.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
//          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: channabBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DottedBorder(
                        color: buttonBackColor,
                        dashPattern: [6, 2, 6, 2],
                        strokeWidth: 2,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        child: (imgProfile == null)
                            ? InkWell(
                                onTap: () {
                                  uploadImage();
                                  //todo
                                },
                                child: Container(
                                  height: 170,
                                  width: SizeConfig.screenWidth - 40,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset("assets/images/upload.png"),
                                        SizedBox(
                                          height: consSmallPad,
                                        ),
                                        Text(
                                          "Image Upload",
                                          style: imageUploadTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 170,
                                width: SizeConfig.screenWidth - 40,
                                child: Image.memory(
                                  imgProfile,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Animal Tag",
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
                            animalTag = v;
                          },
                          decoration: new InputDecoration(
                            hintText: "\$101",
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
                        height: consMedPadH,
                      ),
                      Text(
                        "Date Of Birth",
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
                        child: Stack(
                          children: [
                            Positioned(
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 5, right: 40),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: dividerColor),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: Colors.black),
                                controller:
                                    TextEditingController(text: dateOfBirth),
                              ),
                              left: 0,
                              bottom: 0,
                              top: 0,
                              right: 0,
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: buttonBackColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  height: 45,
                                  width: 45,
                                  child:
                                      Image.asset("assets/images/calendar.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Animal Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      //animal category***********
                      Container(
                        height: 45.0,
                        padding: EdgeInsets.only(left: consMedPadH),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: dividerColor,
                        )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedCategoryName,
                            onChanged: (String newValue) {
                              setState(() {
                                selectedCategoryName = newValue;
                              });
                            },
                            hint: Text(
                              'Select Category',
                              style: hintTextStyle,
                            ),
                            icon: Icon(
                              // Add this
                              Icons.arrow_drop_down, // Add this
                              color: buttonBackColor,
                              size: 40, // Add this
                            ),
                            items: categoriesName
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      //*******************************
                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Animal Sex",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      //animal sex**********************
                      Container(
                        height: 45.0,
                        padding: EdgeInsets.only(left: consMedPadH),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: dividerColor,
                        )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedGender,
                            onChanged: (String newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                            hint: Text(
                              'Select Animal Sex',
                              style: hintTextStyle,
                            ),
                            icon: Icon(
                              // Add this
                              Icons.arrow_drop_down, // Add this
                              color: buttonBackColor,
                              size: 40, // Add this
                            ),
                            items: animalGender
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      //******************
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
                              print("response is calling");
                              if ((imgProfile != null) &&
                                  (animalTag != null) &&
                                  (selectedDate != null) &&
                                  selectedCategoryName != null &&
                                  selectedGender != null) {
                                getResponse();
                              } else {
                                // Find the Scaffold in the widget tree and use
                                // it to show a SnackBar.
                                _scaffoldKey.currentState.showSnackBar(
                                    getSnackBar("Please fill up all fields."));
                              }
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        dateOfBirth =
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      });
  }

  //*************************************************
//upload image

  void uploadImage() async {
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
        builder: (context) => ImagePickerCropper(),
      ),
    );
    var byteImage = await result.readAsBytes();

    if (result != null && result != "NO") {
      imgFile = result;
      setState(() {
        imgProfile = byteImage;
      });
    }
  }

  void getResponse() async {
    Response res = await _animalInfoUpVM.getInfoUpResponse(
        animalTag, selectedCategoryName, selectedGender, selectedDate, imgFile);

    var data = json.decode(res.data);
    if (data["status"].toString() == "200") {
      _scaffoldKey.currentState.showSnackBar(getSnackBar(data["message"]));
      Navigator.of(context).pop(true);
    }
  }
}
