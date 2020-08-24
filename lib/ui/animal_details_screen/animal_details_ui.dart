import 'package:channab/core/model/AnimalModel.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/family_tab/family_pop_up.dart';
import 'package:channab/ui/animal_details_screen/family_tab/family_widget.dart';
import 'package:channab/ui/animal_details_screen/gallery_tab/gallery_pop_up.dart';
import 'package:channab/ui/animal_details_screen/gallery_tab/gallery_widget.dart';
import 'package:channab/ui/animal_details_screen/milking_tab/milking_pop_up.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'description/animal_des.dart';
import 'health_tab/health_pop_up.dart';
import 'health_tab/health_widget.dart';
import 'milking_tab/milking_widget.dart';

class AnimalDetailsUI extends StatefulWidget {
  final int id;
  final String token;

  AnimalDetailsUI(this.id, this.token);

  @override
  _AnimalDetailsUIState createState() => _AnimalDetailsUIState();
}

class _AnimalDetailsUIState extends State<AnimalDetailsUI>
    with SingleTickerProviderStateMixin {
  AnimalDetailsVM _animalDetailsVM;

  //todo this have to be changed*****1
  String nameTag = "CS108";
  String imgUrl = "assets/images/cow_img.jpeg";

  String age = "1 Year";
  String breed = "Breed";

  var status = "Status";
  var gender = "Male";

  var _switchValue = true;

  //todo******************************
  int seletedTabNumber = 0;
  TabController _tabController;

  //for getting token
  @override
  void initState() {
    _animalDetailsVM = AnimalDetailsVM(widget.token);
    _animalDetailsVM.getAllData(widget.id);
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //tab bar widget
  Widget tabBarWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: consMedPadH),
          child: Divider(
            thickness: 2,
            color: dividerColor,
          ),
        ),
        TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.transparent,
          unselectedLabelColor: Colors.transparent,
          onTap: (value) {
            setState(() {
              seletedTabNumber = value;
            });
          },
          tabs: <Widget>[
            (seletedTabNumber == 0)
                ? Tab(
                    child: Container(
                      height: 28,
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Text(
                          "Health",
                          style: tabBarOptionTextStyleWhite,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: buttonBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  )
                : Tab(
                    child: Container(
                      child: Text(
                        "Health",
                        style: tabBarOptionTextStyle,
                      ),
                    ),
                  ),
            (seletedTabNumber == 1)
                ? Tab(
                    child: Container(
                      height: 28,
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Text(
                          "Family",
                          style: tabBarOptionTextStyleWhite,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: buttonBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  )
                : Tab(
                    child: Container(
                      child: Text(
                        "Family",
                        style: tabBarOptionTextStyle,
                      ),
                    ),
                  ),
            (seletedTabNumber == 2)
                ? Tab(
                    child: Container(
                      height: 28,
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Text(
                          "Milking",
                          style: tabBarOptionTextStyleWhite,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: buttonBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  )
                : Tab(
                    child: Container(
                      child: Text(
                        "Milking",
                        style: tabBarOptionTextStyle,
                      ),
                    ),
                  ),
            (seletedTabNumber == 3)
                ? Tab(
                    child: Container(
                      height: 28,
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Text(
                          "Gallery",
                          style: tabBarOptionTextStyleWhite,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: buttonBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  )
                : Tab(
                    child: Container(
                      child: Text(
                        "Gallery",
                        style: tabBarOptionTextStyle,
                      ),
                    ),
                  ),
          ],
          controller: _tabController,
        ),
        SizedBox(
          height: consSmallPad,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: consMedPadH),
          child: Divider(
            thickness: 2,
            color: dividerColor,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              HealthWidgetUI(_animalDetailsVM),
              FamilyWidgetUI(_animalDetailsVM),
              MilkingWidgetUI(_animalDetailsVM),
              GalleryWidgetUI(_animalDetailsVM),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: channabBackgroundColor,
      appBar: AppBar(
        backgroundColor: channabBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        color: channabBackgroundColor,
        child: Column(
          children: [
            //***********Upper portion :1**********
            StreamBuilder<MyAnimalModel>(
                stream: _animalDetailsVM.stream.stream,
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
                                        padding:
                                            EdgeInsets.all(consSmallPad * 1.5),
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
                                        padding:
                                            EdgeInsets.all(consSmallPad * 1.5),
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
                                        padding:
                                            EdgeInsets.all(consSmallPad * 1.5),
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
                                        padding:
                                            EdgeInsets.all(consSmallPad * 1.5),
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
                                    builder: (context) => AnimalDesUI()),
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
                                  showDialog(
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
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                          getFormWidget(),
                                        ],
                                      ),
                                    ),
                                  );
                                  print("On tap is pressed");
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
            //********************uppertion: 2 end**********
            SizedBox(
              height: consMedPadH,
            ),
            //*****************upper Portion 3 start **************

            Expanded(child: tabBarWidget()),
          ],
        ),
      ),
    );
  }

  //this is the pop up widgets
  getFormWidget() {
    if (seletedTabNumber == 0) {
      return HealthPopUp();
    }
    if (seletedTabNumber == 1) {
      return FamilyPopUp(widget.id.toString(), widget.token);
    }
    if (seletedTabNumber == 2) {
      return MilkingPopUp(widget.id.toString(), widget.token);
    }
    if (seletedTabNumber == 3) {
      return GalleryPopUp(widget.id.toString(), widget.token);
    }
  }
}
