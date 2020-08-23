import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimalDesUI extends StatefulWidget {
  @override
  _AnimalDesUIState createState() => _AnimalDesUIState();
}

class _AnimalDesUIState extends State<AnimalDesUI> {
  //todo this have to be changed*****1
  String nameTag = "CS108";
  String imgUrl = "assets/images/cow_img.jpeg";

  String age = "1 Year";
  String breed = "Breed";

  var status = "Status";
  var gender = "Male";

  var _switchValue = true;
  //todo******************************
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: channabBackgroundColor,
      appBar: AppBar(
        backgroundColor: channabBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: channabBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //***********Upper portion :1**********
              Container(
                padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                height: 105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 39 * 2.0,
                            width: 39 * 2.0,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(imgUrl),
                                    radius: 38,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundColor: channabBackgroundColor,
                                    child: CircleAvatar(
                                      backgroundColor: buttonBackColor,
                                      radius: 8,
                                    ),
                                    radius: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: consSmallPad,
                          ),
                          Text(
                            nameTag,
                            style: tagNameTextStyle,
                          ),
                        ],
                      ),
                      flex: 2,
                    ),
                    SizedBox(
                      width: SizeConfig.medPadH,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 38,
                            padding: EdgeInsets.all(consSmallPad * 1.5),
                            decoration: BoxDecoration(
                                color: buttonBackColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: Text(
                              "Age : $age",
                              style: btnTextStyle,
                            )),
                          ),
                          Container(
                            height: 38,
                            padding: EdgeInsets.all(consSmallPad * 1.5),
                            decoration: BoxDecoration(
                                color: buttonBackColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: Text(
                              "$breed",
                              style: btnTextStyle,
                            )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.medPad,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 38,
                            padding: EdgeInsets.all(consSmallPad * 1.5),
                            decoration: BoxDecoration(
                                color: buttonBackColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: Text(
                              "$gender",
                              style: btnTextStyle,
                            )),
                          ),
                          Container(
                            height: 38,
                            padding: EdgeInsets.all(consSmallPad * 1.5),
                            decoration: BoxDecoration(
                                color: buttonBackColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: Text(
                              "$status",
                              style: btnTextStyle,
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //********************Upper Portion : 1 end**********
              SizedBox(
                height: consMedPadH,
              ),
              //********************Upper Portion: 2 start********
              Container(
                padding: EdgeInsets.only(right: consMedPadH, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: buttonBackColor,
                      child: Icon(
                        Icons.add,
                        color: channabBackgroundColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: buttonBackColor,
                      child: Image.asset(
                        "assets/images/alarm.png",
                        color: channabBackgroundColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: buttonBackColor,
                      child: Image.asset(
                        "assets/images/note.png",
                        color: channabBackgroundColor,
                      ),
                    ),
                    CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (v) {
                          setState(() {
                            _switchValue = v;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: consMedPadH,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                child: Divider(
                  thickness: 2,
                  color: dividerColor,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: consSmallPad * 2),
                  padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: desPageCaptionTextStyle,
                      ))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                child: Divider(
                  thickness: 2,
                  color: dividerColor,
                ),
              ),
              SizedBox(
                height: consMedPadH,
              ),
              Container(
                height: 5 * 95.0,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "15 MIN AGO",
                              style: desPageTimeTextStyle,
                            ),
                            SizedBox(
                              height: consSmallPad * 2,
                            ),
                            Text(
                              "I really don’t get what all the"
                              " fuss is about. She could never compare to Cindy, "
                              "Shristy and other famouse models",
                              style: desPageDescriptionTextStyle,
                            ),
                            SizedBox(
                              height: consSmallPad * 2,
                            ),
                            Container(
                              child: Divider(
                                thickness: 2,
                                color: dividerColor,
                              ),
                            ),
                            SizedBox(
                              height: consSmallPad * 2,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
