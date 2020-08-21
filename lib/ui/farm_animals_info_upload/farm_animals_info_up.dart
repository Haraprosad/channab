import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:flutter/material.dart';

class FarmAnimalListUpUI extends StatefulWidget {
  @override
  _FarmAnimalListUpUIState createState() => _FarmAnimalListUpUIState();
}

class _FarmAnimalListUpUIState extends State<FarmAnimalListUpUI> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: buttonBackColor,
        leading: Icon(Icons.arrow_back),
        title: Text("Farm Animals"),
        actions: [
          Image.asset("assets/images/frame2.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
//          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: channabBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        "Animal Tag",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: dividerColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Date Of Birth",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: dividerColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Animal Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: dividerColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: consMedPadH,
                      ),
                      Text(
                        "Animal Sex",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontFamilyRobotoMedium,
                        ),
                      ),

                      SizedBox(
                        height: consMedPadH,
                      ),
                      Container(
                        height: 50.0,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: dividerColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //todo end
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
