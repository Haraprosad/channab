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
            List<ChildAlreadySelect> childList =
                snapshot.data.childAlreadySelect;
            var maleParent = snapshot.data.maleParentsAnimal;
            var femaleParent = snapshot.data.femaleParentsOfAnimals;
            int count;
            if (childList.length == 0) {
              count = childList.length + 1;
            }
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
                        ],
                      );
                    } else {
                      //todo age response of child is not provided in api
                      return cardWidget(
                          true,
                          childs[index - 1].name,
                          childList[index - 1].image,
                          childList[index - 1].gender,
                          age: "1 year 12 months");
                    }
                  }),
            );
          } else {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
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
              borderRadius: BorderRadius.circular(10),
              child: (img != null) ? Image.network(img) : Container()),
        ),
        subtitle: isChild
            ? Text(
                age,
                style: subTitleTextStyle,
              )
            : null,
        title: (title != null)
            ? Text(
                title,
                style: titleTextStyle,
              )
            : Text(""),
        trailing: Container(
          height: 29,
          width: 80,
          decoration: BoxDecoration(
              color: buttonBackColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: (gender != null)
                  ? Text(
                      gender,
                      style: tabBarOptionTextStyleWhite,
                    )
                  : Text("")),
        ),
      ),
    );
  }
}
