import 'package:storma_task/Models/GlobalModel.dart';

class Country extends Global {
  String country ;
  String CountryCode;
  String Slug ;
  String Date;

  Country.fromJson  (Map<String, dynamic> json) : super.fromJson(json) {
    this.country = json["Country"];
    this.CountryCode = json["CountryCode"];
    this.Slug = json["Slug"];
    this.Date = json["Date"];

  }

}