import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FilterPageDialog extends StatefulWidget {
  @override
  FilterPageDialogState createState() => new FilterPageDialogState();
}

class FilterPageDialogState extends State<FilterPageDialog> {
  //range values
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  double minPrice = 0;
  double maxPrice = 0;
  //color
  Color unselectedButtonColor = Colors.transparent;
  //animal type
  bool isDry = false;
  bool isMilking = false;
  bool isBreader = false;
  bool isPregnant = false;
  bool isNone = false;
  //animal category
  bool isBuffalo = false;
  bool isGoat = false;
  bool isSheep = false;
  bool isHorse = false;
  bool isCow = false;
  //animal age
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isFour = false;
  bool isFive = false;

  //Ratings
  bool isOneRatings = false;
  bool isTwoRatings = false;
  bool isThreeRatings = false;
  bool isFourRatings = false;
  bool isFiveRatings = false;
//market name
  bool isJhangMarket = false;
  bool isMultanMarket = false;
  bool isLudanMarket = false;
  double buttonWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    buttonWidth = ((SizeConfig.screenWidth - 40) / 5) - 12;
    return Scaffold(
      backgroundColor: buttonBackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: buttonBackColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: consMedPadH),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: consMedPadH * 1.5,
              ),
              Text(
                "Filter",
                style: filterPageCaptionTextStyle,
              ),
              SizedBox(
                height: consMedPadH,
              ),
              //animal type
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Animal Type",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //dry
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isDry ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isDry = true;
                          isMilking = false;
                          isBreader = false;
                          isPregnant = false;
                          isNone = false;
                        });
                      },
                      child: Text(
                        "Dry",
                        style: isDry
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //milking
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color:
                          isMilking ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isDry = false;
                          isMilking = true;
                          isBreader = false;
                          isPregnant = false;
                          isNone = false;
                        });
                      },
                      child: Text(
                        "Milking",
                        style: isMilking
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //breader
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color:
                          isBreader ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isDry = false;
                          isMilking = false;
                          isBreader = true;
                          isPregnant = false;
                          isNone = false;
                        });
                      },
                      child: Text(
                        "Breader",
                        style: isBreader
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //pregnant
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color:
                          isPregnant ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isDry = false;
                          isMilking = false;
                          isBreader = false;
                          isPregnant = true;
                          isNone = false;
                        });
                      },
                      child: Text(
                        "Pregnant",
                        style: isPregnant
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //none
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isNone ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isDry = false;
                          isMilking = false;
                          isBreader = false;
                          isPregnant = false;
                          isNone = true;
                        });
                      },
                      child: Text(
                        "None",
                        style: isNone
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: consMedPadH,
              ),

              //price range*************************
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Price Range",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: buttonBackColor,
                  inactiveTrackColor: Color(0xFFE6EAEE),
                  thumbColor: buttonBackColor,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                ),
                child: RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  labels: RangeLabels(
                    "${_currentRangeValues.start.round().toString()}\$",
                    "${_currentRangeValues.end.round().toString()}\$",
                  ),
                  onChanged: (RangeValues values) {
                    minPrice = values.start;
                    maxPrice = values.end;
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ),

              //***********************

              //category
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Category",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Buffallo
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color:
                          isBuffalo ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isBuffalo = true;
                          isGoat = false;
                          isSheep = false;
                          isHorse = false;
                          isCow = false;
                        });
                      },
                      child: Text(
                        "Buffalo",
                        style: isBuffalo
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //Goat
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isGoat ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isBuffalo = false;
                          isGoat = true;
                          isSheep = false;
                          isHorse = false;
                          isCow = false;
                        });
                      },
                      child: Text(
                        "Goat",
                        style: isGoat
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //Sheep
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isSheep ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isBuffalo = false;
                          isGoat = false;
                          isSheep = true;
                          isHorse = false;
                          isCow = false;
                        });
                      },
                      child: Text(
                        "Sheep",
                        style: isSheep
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //Horse
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isHorse ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isBuffalo = false;
                          isGoat = false;
                          isSheep = false;
                          isHorse = true;
                          isCow = false;
                        });
                      },
                      child: Text(
                        "Horse",
                        style: isHorse
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //cow
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isCow ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isBuffalo = false;
                          isGoat = false;
                          isSheep = false;
                          isHorse = false;
                          isCow = true;
                        });
                      },
                      child: Text(
                        "Cow",
                        style: isCow
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              //*************
              SizedBox(
                height: consMedPadH,
              ),

              //animal age
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Animal Age",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //1yr
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isOne ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOne = true;
                          isTwo = false;
                          isThree = false;
                          isFour = false;
                          isFive = false;
                        });
                      },
                      child: Text(
                        "1 Year",
                        style: isOne
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //2yr
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isTwo ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOne = false;
                          isTwo = true;
                          isThree = false;
                          isFour = false;
                          isFive = false;
                        });
                      },
                      child: Text(
                        "2 Year",
                        style: isTwo
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //3 yr
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isThree ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOne = false;
                          isTwo = false;
                          isThree = true;
                          isFour = false;
                          isFive = false;
                        });
                      },
                      child: Text(
                        "3 Year",
                        style: isThree
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //4yr
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isFour ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOne = false;
                          isTwo = false;
                          isThree = false;
                          isFour = true;
                          isFive = false;
                        });
                      },
                      child: Text(
                        "4 Year",
                        style: isFour
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //none
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isFive ? buttonBackColor : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOne = false;
                          isTwo = false;
                          isThree = false;
                          isFour = false;
                          isFive = true;
                        });
                      },
                      child: Text(
                        "5 Year",
                        style: isFive
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              //**************
              SizedBox(
                height: consMedPadH,
              ),

              //search by market
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Search By Market",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //breader
                  ButtonTheme(
                    minWidth: buttonWidth * 1.3,
                    child: FlatButton(
                      color: isJhangMarket
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isJhangMarket = true;
                          isMultanMarket = false;
                          isLudanMarket = false;
                        });
                      },
                      child: Text(
                        "Jhang Market",
                        style: isJhangMarket
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //multan market
                  ButtonTheme(
                    minWidth: buttonWidth * 1.3,
                    child: FlatButton(
                      color: isMultanMarket
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isJhangMarket = false;
                          isMultanMarket = true;
                          isLudanMarket = false;
                        });
                      },
                      child: Text(
                        "Multan Market",
                        style: isMultanMarket
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //LudanMarket
                  ButtonTheme(
                    minWidth: buttonWidth * 1.3,
                    child: FlatButton(
                      color: isLudanMarket
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isJhangMarket = false;
                          isMultanMarket = false;
                          isLudanMarket = true;
                        });
                      },
                      child: Text(
                        "Ludan Market",
                        style: isLudanMarket
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              //******************
              SizedBox(
                height: consMedPadH,
              ),
              //ratings
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ratings",
                    style: filterPageTitleTextStyle,
                  ),
                  SizedBox(
                    width: consMedPadH * 1.5,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(
                height: consSmallPad * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //1
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isOneRatings
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOneRatings = true;
                          isTwoRatings = false;
                          isThreeRatings = false;
                          isFourRatings = false;
                          isFiveRatings = false;
                        });
                      },
                      child: Text(
                        "1 Star",
                        style: isOneRatings
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //2
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isTwoRatings
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOneRatings = false;
                          isTwoRatings = true;
                          isThreeRatings = false;
                          isFourRatings = false;
                          isFiveRatings = false;
                        });
                      },
                      child: Text(
                        "2 Star",
                        style: isTwoRatings
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //3
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isThreeRatings
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOneRatings = false;
                          isTwoRatings = false;
                          isThreeRatings = true;
                          isFourRatings = false;
                          isFiveRatings = false;
                        });
                      },
                      child: Text(
                        "3 Star",
                        style: isThreeRatings
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //4
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isFourRatings
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOneRatings = false;
                          isTwoRatings = false;
                          isThreeRatings = false;
                          isFourRatings = true;
                          isFiveRatings = false;
                        });
                      },
                      child: Text(
                        "4 Star",
                        style: isFourRatings
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                  //none
                  ButtonTheme(
                    minWidth: buttonWidth,
                    child: FlatButton(
                      color: isFiveRatings
                          ? buttonBackColor
                          : unselectedButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: buttonBackColor)),
                      onPressed: () {
                        setState(() {
                          isOneRatings = false;
                          isTwoRatings = false;
                          isThreeRatings = false;
                          isFourRatings = false;
                          isFiveRatings = true;
                        });
                      },
                      child: Text(
                        "5 Star",
                        style: isFiveRatings
                            ? filterSelectedTextStyle
                            : filterUnselectedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              //****************
              SizedBox(
                height: consMedPadH * 1.5,
              ),
              Center(
                child: Container(
                  width: SizeConfig.screenWidth * .6,
                  height: 45,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    color: buttonBackColor,
                    child: Text(
                      "Apply Filter",
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
                height: consMedPadH,
              )
            ],
          ),
        ),
      ),
    );
  }
}
