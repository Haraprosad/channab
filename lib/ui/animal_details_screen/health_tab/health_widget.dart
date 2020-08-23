import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:flutter/material.dart';

class HealthWidgetUI extends StatefulWidget {
  final AnimalDetailsVM _animalDetailsVM;

  HealthWidgetUI(this._animalDetailsVM);

  @override
  _HealthWidgetUIState createState() => _HealthWidgetUIState();
}

class _HealthWidgetUIState extends State<HealthWidgetUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5 * 82.0,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return costCardWidget();
                  }),
            ),
            SizedBox(
              height: consSmallPad * 3,
            ),
            Text(
              "Total Health Expenses : 5000 PKR",
              style: healthTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget costCardWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: consSmallPad * 2),
      padding: EdgeInsets.only(left: consMedPadH, right: consMedPadH * 2),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: buttonBackColor,
              child: Icon(
                Icons.add,
                color: channabBackgroundColor,
                size: 15,
              ),
              radius: 10,
            ),
          ),
          SizedBox(
            width: consSmallPad * 2,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "STACY MARTIN",
                      style: healthTitleTextStyle,
                    ),
                    Text(
                      "Cost: 200 PKR",
                      style: healthPriceTextStyle,
                    ),
                  ],
                ),
                Text(
                  "30 MIN AGO",
                  style: healthPageTimeTextStyle,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "I really don’t get what all the fuss is about.This will be better solution",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: healthPageDesTextStyle,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
