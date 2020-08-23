import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:channab/ui/milk_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MilkingWidgetUI extends StatefulWidget {
  final AnimalDetailsVM _animalDetailsVM;

  MilkingWidgetUI(this._animalDetailsVM);

  @override
  _MilkingWidgetUIState createState() => _MilkingWidgetUIState();
}

class _MilkingWidgetUIState extends State<MilkingWidgetUI> {
  //todo this have to be changed
  List<MilkCount> milkDetails = [
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("27 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
    MilkCount("26 Jun 2020", "10 Liter", "8 Liter", "18 Liter"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  left: consMedPadH, right: consMedPadH, top: consSmallPad * 2),
              height: 510,
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
                    height: milkDetails.length * 55.0,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: milkDetails.length,
                        itemBuilder: (context, index) {
                          return dateWiseWidget(
                              milkDetails[index].date,
                              milkDetails[index].morningMilk,
                              milkDetails[index].eveningMilk,
                              milkDetails[index].totalMilk);
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
                              "100 Liter",
                              style: tableEndTextStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "80 Liter",
                              style: tableEndTextStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "180 Liter",
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
      ),
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
