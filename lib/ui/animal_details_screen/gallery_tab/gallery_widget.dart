import 'package:channab/shared/constants.dart';
import 'package:flutter/material.dart';

class GalleryWidgetUI extends StatefulWidget {
  @override
  _GalleryWidgetUIState createState() => _GalleryWidgetUIState();
}

class _GalleryWidgetUIState extends State<GalleryWidgetUI> {
  List<String> images = [
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
    "assets/images/cow_img.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: consMedPadH, right: consMedPadH, top: consMedPadH),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(images[index]),
              ),
            );
          }),
    );
  }
}
