// To parse this JSON data, do
//
//     final myModel = myModelFromJson(jsonString);

import 'dart:convert';

MyAnimalModel myModelFromJson(String str) => MyAnimalModel.fromJson(json.decode(str));

String myModelToJson(MyAnimalModel data) => json.encode(data.toJson());

class MyAnimalModel {
  MyAnimalModel({
    this.status,
    this.allDescriptionList,
    this.productDetails,
    this.gallerList,
    this.milkAllRecord,
    this.allHealthRecordList,
    this.childAlreadySelect,
    this.allChildsUserCanSelect,
    this.allFemaleUserCanSelect,
    this.allMaleUserCanSelect,
    this.femaleParentsOfAnimals,
    this.maleParentsAnimal,
  });

  int status;
  List<AllDescriptionList> allDescriptionList;
  ProductDetails productDetails;
  List<GallerList> gallerList;
  MilkAllRecord milkAllRecord;
  List<AllHealthRecordList> allHealthRecordList;
  List<ChildAlreadySelect> childAlreadySelect;
  List<AllUserCanSelect> allChildsUserCanSelect;
  List<AllUserCanSelect> allFemaleUserCanSelect;
  List<AllUserCanSelect> allMaleUserCanSelect;
  FemaleParentsOfAnimals femaleParentsOfAnimals;
  FemaleParentsOfAnimals maleParentsAnimal;

  factory MyAnimalModel.fromJson(Map<String, dynamic> json) => MyAnimalModel(
        status: json["status"],
        allDescriptionList: List<AllDescriptionList>.from(
            json["all_description_list"]
                .map((x) => AllDescriptionList.fromJson(x))),
        productDetails: ProductDetails.fromJson(json["product_details"]),
        gallerList: List<GallerList>.from(
            json["galler_list"].map((x) => GallerList.fromJson(x))),
        milkAllRecord: MilkAllRecord.fromJson(json["milk_all_record"]),
        allHealthRecordList: List<AllHealthRecordList>.from(
            json["all_health_record_list"]
                .map((x) => AllHealthRecordList.fromJson(x))),
        childAlreadySelect: List<ChildAlreadySelect>.from(
            json["child_already_select"]
                .map((x) => ChildAlreadySelect.fromJson(x))),
        allChildsUserCanSelect: List<AllUserCanSelect>.from(
            json["all_childs_user_can_select"]
                .map((x) => AllUserCanSelect.fromJson(x))),
        allFemaleUserCanSelect: List<AllUserCanSelect>.from(
            json["all_female_user_can_select"]
                .map((x) => AllUserCanSelect.fromJson(x))),
        allMaleUserCanSelect: List<AllUserCanSelect>.from(
            json["all_male_user_can_select"]
                .map((x) => AllUserCanSelect.fromJson(x))),
        femaleParentsOfAnimals:
            FemaleParentsOfAnimals.fromJson(json["female_parents_of_animals"]),
        maleParentsAnimal:
            FemaleParentsOfAnimals.fromJson(json["male_parents_animal"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "all_description_list":
            List<dynamic>.from(allDescriptionList.map((x) => x.toJson())),
        "product_details": productDetails.toJson(),
        "galler_list": List<dynamic>.from(gallerList.map((x) => x.toJson())),
        "milk_all_record": milkAllRecord.toJson(),
        "all_health_record_list":
            List<dynamic>.from(allHealthRecordList.map((x) => x.toJson())),
        "child_already_select":
            List<dynamic>.from(childAlreadySelect.map((x) => x.toJson())),
        "all_childs_user_can_select":
            List<dynamic>.from(allChildsUserCanSelect.map((x) => x.toJson())),
        "all_female_user_can_select":
            List<dynamic>.from(allFemaleUserCanSelect.map((x) => x.toJson())),
        "all_male_user_can_select":
            List<dynamic>.from(allMaleUserCanSelect.map((x) => x.toJson())),
        "female_parents_of_animals": femaleParentsOfAnimals.toJson(),
        "male_parents_animal": maleParentsAnimal.toJson(),
      };
}

class AllUserCanSelect {
  AllUserCanSelect({
    this.animalTag,
    this.id,
  });

  String animalTag;
  int id;

  factory AllUserCanSelect.fromJson(Map<String, dynamic> json) =>
      AllUserCanSelect(
        animalTag: json["animal_tag"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "animal_tag": animalTag,
        "id": id,
      };
}

class AllDescriptionList {
  AllDescriptionList({
    this.description,
    this.createdOn,
    this.id,
  });

  String description;
  String createdOn;
  int id;

  factory AllDescriptionList.fromJson(Map<String, dynamic> json) =>
      AllDescriptionList(
        description: json["description"],
        createdOn: json["created_on"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "created_on": createdOn,
        "id": id,
      };
}

class AllHealthRecordList {
  AllHealthRecordList({
    this.ago,
    this.tagName,
    this.costAmount,
    this.id,
    this.textDescription,
  });

  String ago;
  String tagName;
  String costAmount;
  int id;
  String textDescription;

  factory AllHealthRecordList.fromJson(Map<String, dynamic> json) =>
      AllHealthRecordList(
        ago: json["ago"],
        tagName: json["tag_name"],
        costAmount: json["cost_amount"].toString(),
        id: json["id"],
        textDescription: json["text_description"],
      );

  Map<String, dynamic> toJson() => {
        "ago": ago,
        "tag_name": tagName,
        "cost_amount": costAmount,
        "id": id,
        "text_description": textDescription,
      };
}

class ChildAlreadySelect {
  ChildAlreadySelect({
    this.deleteId,
    this.animalTag,
    this.image,
    this.gender,
  });

  int deleteId;
  String animalTag;
  String image;
  String gender;

  factory ChildAlreadySelect.fromJson(Map<String, dynamic> json) =>
      ChildAlreadySelect(
        deleteId: json["delete_id"],
        animalTag: json["animal_tag"],
        image: json["image"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "delete_id": deleteId,
        "animal_tag": animalTag,
        "image": image,
        "gender": gender,
      };
}

class FemaleParentsOfAnimals {
  FemaleParentsOfAnimals({
    this.id,
    this.animalTag,
    this.animalImage,
    this.gender,
  });

  int id;
  String animalTag;
  String animalImage;
  String gender;

  factory FemaleParentsOfAnimals.fromJson(Map<String, dynamic> json) =>
      FemaleParentsOfAnimals(
        id: json["id"],
        animalTag: json["animal_tag"],
        animalImage: json["animal_image"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "animal_tag": animalTag,
        "animal_image": animalImage,
        "gender": gender,
      };
}

class GallerList {
  GallerList({
    this.image,
    this.id,
  });

  String image;
  int id;

  factory GallerList.fromJson(Map<String, dynamic> json) => GallerList(
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
      };
}

class MilkAllRecord {
  MilkAllRecord({
    this.milkDataByRow,
    this.sumOfMorningColoumn,
    this.sumOfEveningColourmn,
    this.sumOfAll,
  });

  List<MilkDataByRow> milkDataByRow;
  int sumOfMorningColoumn;
  int sumOfEveningColourmn;
  int sumOfAll;

  factory MilkAllRecord.fromJson(Map<String, dynamic> json) => MilkAllRecord(
        milkDataByRow: List<MilkDataByRow>.from(
            json["milk_data_by_row"].map((x) => MilkDataByRow.fromJson(x))),
        sumOfMorningColoumn: json["sum_of_morning_coloumn"],
        sumOfEveningColourmn: json["sum_of_evening_colourmn"],
        sumOfAll: json["sum_of_all"],
      );

  Map<String, dynamic> toJson() => {
        "milk_data_by_row":
            List<dynamic>.from(milkDataByRow.map((x) => x.toJson())),
        "sum_of_morning_coloumn": sumOfMorningColoumn,
        "sum_of_evening_colourmn": sumOfEveningColourmn,
        "sum_of_all": sumOfAll,
      };
}

class MilkDataByRow {
  MilkDataByRow({
    this.morningTime,
    this.id,
    this.eveningTime,
    this.sumOfOne,
    this.createdOn,
  });

  String morningTime;
  int id;
  String eveningTime;
  String sumOfOne;
  String createdOn;

  factory MilkDataByRow.fromJson(Map<String, dynamic> json) => MilkDataByRow(
        morningTime: json["morning_time"].toString(),
        id: json["id"],
        eveningTime: json["evening_time"].toString(),
        sumOfOne: json["sum_of_one"].toString(),
        createdOn: json["created_on"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "morning_time": morningTime,
        "id": id,
        "evening_time": eveningTime,
        "sum_of_one": sumOfOne,
        "created_on": createdOn,
      };
}

class ProductDetails {
  ProductDetails({
    this.ageInYear,
    this.ageInMonth,
    this.ageInDay,
    this.productId,
    this.animalTag,
    this.animalDateOfBirth,
    this.animalGender,
    this.animalType,
    this.animalBreed,
    this.costPurchase,
    this.dateOfPurchase,
    this.productImage,
  });

  int ageInYear;
  int ageInMonth;
  int ageInDay;
  String productId;
  String animalTag;
  String animalDateOfBirth;
  String animalGender;
  String animalType;
  String animalBreed;
  String costPurchase;
  DateTime dateOfPurchase;
  String productImage;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        ageInYear: json["age_in_year"],
        ageInMonth: json["age_in_month"],
        ageInDay: json["age_in_day"],
        productId: json["product_id"],
        animalTag: json["animal_tag"],
        animalDateOfBirth: json["animal_date_of_birth"],
        animalGender: json["animal_gender"],
        animalType: json["animal_type"],
        animalBreed: json["animal_breed"],
        costPurchase: json["cost_purchase"],
        dateOfPurchase: DateTime.parse(json["date_of_purchase"]),
        productImage: json["product_image"],
      );

  Map<String, dynamic> toJson() => {
        "age_in_year": ageInYear,
        "age_in_month": ageInMonth,
        "age_in_day": ageInDay,
        "product_id": productId,
        "animal_tag": animalTag,
        "animal_date_of_birth": animalDateOfBirth,
        "animal_gender": animalGender,
        "animal_type": animalType,
        "animal_breed": animalBreed,
        "cost_purchase": costPurchase,
        "date_of_purchase":
            "${dateOfPurchase.year.toString().padLeft(4, '0')}-${dateOfPurchase.month.toString().padLeft(2, '0')}-${dateOfPurchase.day.toString().padLeft(2, '0')}",
        "product_image": productImage,
      };
}
