import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../child.dart';

class FamilyWidgetUI extends StatefulWidget {
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
    return Container(
      padding: EdgeInsets.only(left: consMedPadH, right: consMedPadH),
      child: ListView.builder(
          itemCount: childs.length,
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
                  cardWidget(false, "Animal Tag Name",
                      "assets/images/cow_img.jpeg", "Male"),
                  SizedBox(
                    height: consSmallPad * 2,
                  ),
                  cardWidget(false, "Animal Tag Name",
                      "assets/images/cow_img.jpeg", "Female"),
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
                  cardWidget(true, childs[index].name,
                      "assets/images/cow_img.jpeg", "Male",
                      age: childs[index].age)
                ],
              );
            }
            return cardWidget(
                true, childs[index].name, "assets/images/cow_img.jpeg", "Male",
                age: childs[index].age);
          }),
    );
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
