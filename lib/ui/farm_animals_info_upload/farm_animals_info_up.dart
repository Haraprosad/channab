import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/image_picker_cropper.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class FarmAnimalListUpUI extends StatefulWidget {
  @override
  _FarmAnimalListUpUIState createState() => _FarmAnimalListUpUIState();
}

class _FarmAnimalListUpUIState extends State<FarmAnimalListUpUI> {
  var imgProfile;
  //madis and category
  List<String> categoriesName = [
    "Cow",
    "Buffalo",
    "Goat",
    "Sheep",
    "Horse",
    "Others"
  ];
  String selectedCategoryName = "Cow";
  List<String> animalGender = ["Male", "Female"];
  String selectedGender = "Male";
  //date
  var selectedDate;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
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
                                  hintText: "DOB",
                                  labelText: (selectedDate != null)
                                      ? "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"
                                      : "DOB",
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 5, right: 40),
                                  hintStyle: hintTextStyle,
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: dividerColor),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),
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
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
      setState(() {
        imgProfile = byteImage;
      });
    }
  }
}
