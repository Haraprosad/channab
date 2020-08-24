import 'package:channab/core/model/AnimalModel.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../child.dart';

class FamilyWidgetUI extends StatefulWidget {
  final AnimalDetailsVM _animalDetailsVM;

  FamilyWidgetUI(this._animalDetailsVM);

  @override
  _FamilyWidgetUIState createState() => _FamilyWidgetUIState();
}

class _FamilyWidgetUIState extends State<FamilyWidgetUI> {
  //todo this have to be changed
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyAnimalModel>(
        future: widget._animalDetailsVM.getFamilyData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AllUserCanSelect> childList =
                snapshot.data?.allChildsUserCanSelect ?? [];
            var maleParent = snapshot.data?.maleParentsAnimal ?? [];
            var femaleParent = snapshot.data?.femaleParentsOfAnimals ?? [];

            if (childList.isNotEmpty) {
              //regular view
            } else {
              //container no data
            }
          }

          var childList = snapshot.data?.allChildsUserCanSelect ?? [];
          var maleParent = snapshot.data?.maleParentsAnimal ?? [];
          var femaleParent = snapshot.data?.femaleParentsOfAnimals ?? [];
          int count;
          if (childList.length == 0) {
            count = 1;
          } else {
            count = childList.length;
          }

          //todo fix this
          // 98 and 99
          return Container(
            padding: EdgeInsets.only(left: consMedPadH, right: consMedPadH),
            child: ListView.builder(
                itemCount: count,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          height: consSmallPad * 2,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: consSmallPad * 2),
                            child: Text(
                              "Parents",
                              style: captionTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: consMedPadH,
                        ),
                        cardWidget(false, maleParent.animalTag,
                            maleParent.animalImage, "Male"),
                        SizedBox(
                          height: consSmallPad * 2,
                        ),
                        cardWidget(false, femaleParent.animalTag,
                            femaleParent.animalImage, "Female"),
                        SizedBox(
                          height: consMedPad * 2,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: consSmallPad * 2),
                            child: Text(
                              "Childs",
                              style: captionTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: consSmallPad * 2,
                        ),
                        cardWidget(true, childList[index].animalTag,
                            "assets/images/cow_img.jpeg", "Male",
                            age: childs[index].age)
                      ],
                    );
                  }
                  //todo image response and age response of child is not provided in api
                  return cardWidget(true, childs[index].name,
                      "assets/images/cow_img.jpeg", "Male",
                      age: "1 Year 11 Months");
                }),
          );
        });
  }

  cardWidget(bool isChild, String title, String img, String gender,
      {String age}) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 5, right: 10, bottom: 5),
        leading: Container(
          height: 55,
          width: 55,
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
              color: buttonBackColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            gender,
            style: tabBarOptionTextStyleWhite,
          )),
        ),
      ),
    );
  }
}
