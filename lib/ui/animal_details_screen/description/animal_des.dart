import 'package:channab/core/model/AnimalModel.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/description/AnimalDetailsDescriptionVM.dart';
import 'package:channab/ui/animal_details_screen/description/description_pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimalDesUI extends StatefulWidget {
  int id;
  String token;
  AnimalDesUI(this.id, this.token);
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

  AnimalDetailsDescriptionVM _vm;

  @override
  void initState() {
    //replace hard coading
    int id = widget.id;
    String token = widget.token;
//    String token = "50a67c112aff02f32cfefd52c242933b727d28bd";
    _vm = AnimalDetailsDescriptionVM(token);
    _vm.getAllData(id);
    super.initState();
  }

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
              StreamBuilder<MyAnimalModel>(
                  stream: _vm.stream.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var model = snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: consMedPadH),
                            height: 105,
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  backgroundImage: NetworkImage(
                                                      model.productDetails
                                                          .productImage),
                                                  radius: 36,
                                                ),
                                              ),
                                              Positioned(
                                                right: 10,
                                                bottom: 0,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      channabBackgroundColor,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        buttonBackColor,
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
                                          model.productDetails.animalTag,
                                          style: tagNameTextStyle,
                                        ),
                                      ],
                                    ),
                                    flex: 3,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.medPadH,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 38,
                                          padding: EdgeInsets.all(
                                              consSmallPad * 1.5),
                                          decoration: BoxDecoration(
                                              color: buttonBackColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
                                          child: Center(
                                              child: Text(
                                            "Age : ${model.productDetails.ageInYear} Year",
                                            style: btnTextStyle,
                                          )),
                                        ),
                                        Container(
                                          height: 38,
                                          padding: EdgeInsets.all(
                                              consSmallPad * 1.5),
                                          decoration: BoxDecoration(
                                              color: buttonBackColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
                                          child: Center(
                                              child: Text(
                                            "${model.productDetails.animalBreed}",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 38,
                                          padding: EdgeInsets.all(
                                              consSmallPad * 1.5),
                                          decoration: BoxDecoration(
                                              color: buttonBackColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
                                          child: Center(
                                              child: Text(
                                            "${model.productDetails.animalGender}",
                                            style: btnTextStyle,
                                          )),
                                        ),
                                        Container(
                                          height: 38,
                                          padding: EdgeInsets.all(
                                              consSmallPad * 1.5),
                                          decoration: BoxDecoration(
                                              color: buttonBackColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
                                          child: Center(
                                              child: Text(
                                            "${model.productDetails.animalType}",
                                            style: btnTextStyle,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      //todo
                                      builder: (context) => AnimalDesUI(
                                          int.parse(
                                              model.productDetails.productId),
                                          widget.token)),
                                );
                              },
                            ),
                          ),
                          //********************Upper Portion : 1 end**********
                          SizedBox(
                            height: consMedPadH,
                          ),
                          //********************Upper Portion: 2 start********
                          Container(
                            padding:
                                EdgeInsets.only(right: consMedPadH, left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: buttonBackColor,
                                    child: Icon(
                                      Icons.add,
                                      color: channabBackgroundColor,
                                    ),
                                  ),
                                  onTap: () {
                                    showPopupDialog();
                                  },
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
                                //todo this causes problem
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
                        ],
                      );
                    } else {
                      return Container(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
              //********************Upper Portion : 1 end**********

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
              StreamBuilder<MyAnimalModel>(
                  stream: _vm.stream.stream,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      var model = snapshot.data.allDescriptionList;
                      return Container(
                        height: 5 * 95.0,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: model.length,
                            itemBuilder: (context, index) {
                              var item = model[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: consMedPadH),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item.createdOn,
                                      style: desPageTimeTextStyle,
                                    ),
                                    SizedBox(
                                      height: consSmallPad * 2,
                                    ),
                                    Text(
                                      item.description,
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
                      );
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  void showPopupDialog() async {
    bool res = await showDialog(
      context: context,
      child: AlertDialog(
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            DescriptionPopUp(widget.token, widget.id),
          ],
        ),
      ),
    );

    if (res) {
      _vm.requestUpdate();
    }
  }
}
