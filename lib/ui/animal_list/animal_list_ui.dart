import 'package:channab/core/model/animal_list_model.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/animal_details_ui.dart';
import 'package:channab/ui/animal_list/animal_list_vm.dart';
import 'package:channab/ui/farm_animals_info_upload/farm_animals_info_up.dart';
import 'package:channab/ui/filter_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimalListUI extends StatefulWidget {
  final String token;

  AnimalListUI(this.token);

  @override
  _AnimalListUIState createState() => _AnimalListUIState();
}

class _AnimalListUIState extends State<AnimalListUI> {
  AnimalListVM _animalListVM;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('logInToken');
    return stringValue;
  }

  @override
  void initState() {
//    String token = getStringValuesSF();

//    String token = "50a67c112aff02f32cfefd52c242933b727d28bd";

    //todo token have to be changed
    _animalListVM = AnimalListVM(widget.token);
    _animalListVM.getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: buttonBackColor,
        leading: Icon(Icons.arrow_back),
        title: Text("Animals List"),
        actions: [
          InkWell(
              onTap: () {
                _getFilterPageDialog();
              },
              child: Image.asset("assets/images/frame.png")),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: consMedPadH,
              ),
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: consMedPadH * 1),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: consSmallPad),
                        width: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: buttonBackColor,
                        ),
                        child: Center(
                            child: Text(
                          "None",
                          style: TextStyle(color: Colors.white),
                        )),
                      );
                    }),
              ),
              SizedBox(
                height: consMedPadH,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Animals",
                      style: animalListCaptionTextStyle,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: buttonBackColor,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FarmAnimalListUpUI(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: consMedPadH,
              ),
              StreamBuilder<AnimalListModel>(
                  stream: _animalListVM.getStream.stream,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      var model = snapshot.data;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                        height: model.allAnimalList.length * 108.0,
                        child: ListView.builder(
                          itemCount: model.allAnimalList.length,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () {
                                //now hardcoded to show the demo
                                Navigator.push(
                                  ctx,
                                  MaterialPageRoute(
                                      builder: (context) => AnimalDetailsUI(
                                          model.allAnimalList[index].id,
                                          widget.token)),
                                );
                              },
                              child: animalCardWidget(
                                  true,
                                  model.allAnimalList[index].animalTag,
                                  model.allAnimalList[index].image,
                                  model.allAnimalList[index].gender,
                                  index,
                                  model.allAnimalList[index].animalType,
                                  age:
                                      "${model.allAnimalList[index].yearResult} year "
                                      "${model.allAnimalList[index].monthResult}"),
                            );
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  animalCardWidget(bool isChild, String title, String img, String gender,
      int index, String animalCondition,
      {String age}) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding:
            EdgeInsets.only(left: 5, right: 10, bottom: 10, top: 10),
        leading: Container(
//          height: 85,
//          width: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 60,
                  width: 60,
                  child: Image.network(
                    img,
                    fit: BoxFit.fill,
                  ))),
        ),
        subtitle: isChild
            ? Text(
                age,
                style: subTitleTextStyle,
              )
            : null,
        title: Text(
          title,
          style: titleTextStyle,
        ),
        trailing: Container(
          height: 29,
          width: 80,
          decoration: BoxDecoration(
              color: getButtonColor(animalCondition.toLowerCase()),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            animalCondition,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

  getButtonColor(String lowerCase) {
    if (lowerCase == "dry") {
      return redColor;
    } else if (lowerCase == "pregnant") {
      return buttonBackColor;
    } else if (lowerCase == "milking") {
      return lightBluishColor;
    } else {
      return lightRedColor;
    }
  }

  void _getFilterPageDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return FilterPageDialog();
        },
        fullscreenDialog: true));
  }
}
