class AnimalListModel {
  List<AllAnimalList> allAnimalList;
  int status;

  AnimalListModel({this.allAnimalList, this.status});

  AnimalListModel.fromJson(Map<String, dynamic> json) {
    if (json['all_animal_list'] != null) {
      allAnimalList = new List<AllAnimalList>();
      json['all_animal_list'].forEach((v) {
        allAnimalList.add(new AllAnimalList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allAnimalList != null) {
      data['all_animal_list'] =
          this.allAnimalList.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class AllAnimalList {
  int id;
  String animalTag;
  String gender;
  String image;
  bool status;
  String animalType;
  String animalBreed;
  String category;
  int yearResult;
  int monthResult;
  int dayResult;

  AllAnimalList(
      {this.id,
      this.animalTag,
      this.gender,
      this.image,
      this.status,
      this.animalType,
      this.animalBreed,
      this.category,
      this.yearResult,
      this.monthResult,
      this.dayResult});

  AllAnimalList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animalTag = json['animal_tag'];
    gender = json['gender'];
    image = json['image'];
    status = json['status'];
    animalType = json['animal_type'];
    animalBreed = json['animal_breed'];
    category = json['category'];
    yearResult = json['year_result'];
    monthResult = json['month_result'];
    dayResult = json['day_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['animal_tag'] = this.animalTag;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['status'] = this.status;
    data['animal_type'] = this.animalType;
    data['animal_breed'] = this.animalBreed;
    data['category'] = this.category;
    data['year_result'] = this.yearResult;
    data['month_result'] = this.monthResult;
    data['day_result'] = this.dayResult;
    return data;
  }
}
