import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/filter_dialog_page.dart';
import 'package:flutter/material.dart';

import '../child.dart';

class AnimalListUI extends StatefulWidget {
  @override
  _AnimalListUIState createState() => _AnimalListUIState();
}

class _AnimalListUIState extends State<AnimalListUI> {
  List<Child> childs = [
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
    Child("Animal Tag Name", "1 Year 11 Months"),
  ];
  List<String> conditions = [
    "Dry",
    "Pregnant",
    "Milking",
    "None",
    "Dry",
    "Pregnant",
    "Milking",
    "None",
    "Dry",
    "Pregnant",
    "Milking",
    "None"
  ];
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
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: consMedPadH,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: consMedPadH),
                height: childs.length * 125.0,
                child: ListView.builder(
                    itemCount: childs.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return animalCardWidget(true, childs[index].name,
                          "assets/images/cow_img.jpeg", "Male", index,
                          age: childs[index].age);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  animalCardWidget(
      bool isChild, String title, String img, String gender, int index,
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
              borderRadius: BorderRadius.circular(10), child: Image.asset(img)),
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
              color: getButtonColor(conditions[index].toLowerCase()),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            conditions[index],
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
