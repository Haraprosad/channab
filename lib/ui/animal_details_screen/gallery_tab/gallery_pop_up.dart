import 'dart:convert';

import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/image_picker_cropper.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/shared/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'gallery_pop_up_vm.dart';

class GalleryPopUp extends StatefulWidget {
  final String id;
  final String token;

  GalleryPopUp(this.id, this.token);

  @override
  _GalleryPopUpState createState() => _GalleryPopUpState();
}

class _GalleryPopUpState extends State<GalleryPopUp> {
  GalleryPopUpVM _galleryPopUpVM;
  var imgProfile;
  var imgFile;

  @override
  void initState() {
    _galleryPopUpVM = GalleryPopUpVM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Image",
            style: TextStyle(
              fontSize: 18,
              color: buttonBackColor,
              fontFamily: fontFamilyMontserratBold,
            ),
          ),

          SizedBox(
            height: consMedPadH,
          ),
          DottedBorder(
            color: buttonBackColor,
            dashPattern: [6, 2, 6, 2],
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            child: (imgProfile == null)
                ? InkWell(
                    onTap: () {
                      uploadImage();
                      //todo
                    },
                    child: Container(
                      height: 170,
                      width: SizeConfig.screenWidth - 40,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/upload.png"),
                            SizedBox(
                              height: consSmallPad,
                            ),
                            Text(
                              "Image Upload",
                              style: imageUploadTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 170,
                    width: SizeConfig.screenWidth - 40,
                    child: Image.memory(
                      imgProfile,
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
          SizedBox(
            height: consMedPadH * 1.5,
          ),
          Center(
            child: Container(
              width: 220,
              height: 45,
              child: RaisedButton(
                color: buttonBackColor,
                child: Text(
                  "Save Information",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: fontFamilyRobotoMedium),
                ),
                onPressed: () {
                  //todo
                  getGallerySave();
                },
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          //todo end
        ],
      ),
    );
  }

  void uploadImage() async {
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
        builder: (context) => ImagePickerCropper(),
      ),
    );
    var byteImage = await result.readAsBytes();

    if (result != null && result != "NO") {
      imgFile = result;
      setState(() {
        imgProfile = byteImage;
      });
    }
  }

  void getGallerySave() async {
    var res = await _galleryPopUpVM.getGalleryPopResponse(imgFile, widget.id);
    var data = json.decode(res.data);
    if (data["status"].toString() == "200") {
      Navigator.of(context).pop(true);
    }
  }
}
