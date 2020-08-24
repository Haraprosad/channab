import 'package:channab/core/model/AnimalModel.dart';
import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MilkingWidgetUI extends StatefulWidget {
  final AnimalDetailsVM _animalDetailsVM;

  MilkingWidgetUI(this._animalDetailsVM);

  @override
  _MilkingWidgetUIState createState() => _MilkingWidgetUIState();
}

class _MilkingWidgetUIState extends State<MilkingWidgetUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<MyAnimalModel>(
          future: widget._animalDetailsVM.getMilkingData(),
          builder: (context, snapshot) {
            var model = snapshot.data?.milkAllRecord?.milkDataByRow ?? [];
            var rec = snapshot.data?.milkAllRecord ?? MilkAllRecord();
            return Column(
              children: [
                SizedBox(
                  height: consSmallPad,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: buttonBackColor,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: consMedPadH * 1.5),
                    height: 32,
                    width: 32,
                    child: Image.asset(
                      "assets/images/frame.png",
                      color: channabBackgroundColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(consSmallPad),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: dividerColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.only(
                        left: consMedPadH,
                        right: consMedPadH,
                        top: consSmallPad * 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: consMedPad,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Date",
                                    style: tableCaptionTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Morning",
                                    style: tableCaptionTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Evening",
                                    style: tableCaptionTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Total",
                                    style: tableCaptionTextStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: model.length * 55.0,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: model.length,
                              itemBuilder: (context, index) {
                                return dateWiseWidget(
                                    model[index].createdOn,
                                    model[index].morningTime.toString(),
                                    model[index].eveningTime.toString(),
                                    model[index].sumOfOne.toString());
                              }),
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: consMedPad,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Total/week",
                                    style: tableEndTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${rec?.sumOfMorningColoumn ?? ""}",
                                    style: tableEndTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${rec?.sumOfEveningColourmn ?? ""}",
                                    style: tableEndTextStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${rec?.sumOfAll ?? ""}",
                                    style: tableEndTextStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget dateWiseWidget(
      String date, String morningMilk, String eveningMilk, String totalMilk) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            SizedBox(
              width: consMedPad,
            ),
            Expanded(
              flex: 3,
              child: Text(
                date,
                style: tableComponentTextStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                morningMilk,
                style: tableComponentTextStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                eveningMilk,
                style: tableComponentTextStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                totalMilk,
                style: tableComponentTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
