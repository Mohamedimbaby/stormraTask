import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storma_task/Models/CountryModel.dart';
import 'package:storma_task/Models/SummaryModel.dart';
import 'package:storma_task/networking/Api.dart';
import 'package:storma_task/utils/Strings.dart';

class CountriesRepositories {

 static Future<SummaryModel>  getSummary()async{
    var responseDecoded = await Api.networkRequest(SUMMARY);
    SummaryModel  summaryModel = SummaryModel.fromJson(responseDecoded);
    return summaryModel;
  }
static HashSet<Circle> _circles = HashSet();

 static int _counter = 0 ;
static void _setCircle(LatLng point ) {
  _circles.add(Circle(
      circleId: CircleId("circle_id_$_counter"),
      strokeColor: Colors.redAccent.shade200.withOpacity(.5),
      center: point,
        visible: true,

    strokeWidth: 50,
    radius: 5000
  ));
  _counter++;
}

 static Future<HashSet<Circle>> drawCircles(List <Country> countries)async {
   for(int counter =0 ;_counter < 30;counter++){
     try{
       List<Location> locations = await locationFromAddress(countries[counter].country);
       _setCircle(LatLng(locations[0].latitude,locations[0].longitude));
     }catch(e){
       print(e.toString());
     }
   }
   return _circles;
 }

}