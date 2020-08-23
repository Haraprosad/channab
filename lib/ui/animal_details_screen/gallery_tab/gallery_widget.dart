import 'package:channab/core/model/AnimalModel.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/ui/animal_details_screen/viewmodel/AnimaldetailsVM.dart';
import 'package:flutter/material.dart';

class GalleryWidgetUI extends StatefulWidget {
  final AnimalDetailsVM _animalDetailsVM;

  GalleryWidgetUI(this._animalDetailsVM);

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget._animalDetailsVM);
    return FutureBuilder<MyAnimalModel>(
        future: widget._animalDetailsVM.getGalleryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var model = snapshot.data.gallerList;
            return Container(
              padding: EdgeInsets.only(
                  left: consMedPadH, right: consMedPadH, top: consMedPadH),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: model.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0),
                  itemBuilder: (context, index) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(model[index].image),
                      ),
                    );
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
