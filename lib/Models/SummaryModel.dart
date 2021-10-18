import 'package:storma_task/Models/CountryModel.dart';
import 'package:storma_task/Models/GlobalModel.dart';

class SummaryModel {
  Global global;
  List<Country>countries = [];
  SummaryModel.fromJson(Map<String , dynamic> json){
    this.global =  Global.fromJson(json["Global"]);
    for(var item in json["Countries"])
    {
      this.countries.add(Country.fromJson(item));
    }
  }
}