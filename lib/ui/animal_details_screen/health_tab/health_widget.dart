import 'package:channab/core/model/AnimalModel.dart';
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
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: StreamBuilder<MyAnimalModel>(
          stream: widget._animalDetailsVM.stream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var model = snapshot.data.allHealthRecordList;
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: model.length * 82.0,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: model.length,
                          itemBuilder: (context, index) {
                            totalAmount = totalAmount +
                                int.parse(model[index].costAmount);
                            return costCardWidget(
                                model[index].tagName,
                                model[index].costAmount,
                                model[index].ago,
                                model[index].textDescription);
                          }),
                    ),
                    SizedBox(
                      height: consSmallPad * 3,
                    ),
                    Text(
                      "Total Health Expenses : $totalAmount PKR",
                      style: healthTitleTextStyle,
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }

  Widget costCardWidget(
      String name, String cost, String ago, String description) {
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
                    //todo health record is not found
                    Text(
                      name,
                      style: healthTitleTextStyle,
                    ),
                    Text(
                      cost,
                      style: healthPriceTextStyle,
                    ),
                  ],
                ),
                Text(
                  ago,
                  style: healthPageTimeTextStyle,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
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
