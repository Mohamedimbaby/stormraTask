import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storma_task/Bloc/CovidBloc.dart';
import 'package:storma_task/Bloc/CovidEvent.dart';
import 'package:storma_task/Bloc/CovidState.dart';
import 'package:storma_task/Models/CountryModel.dart';

import 'DetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder :()=> MaterialApp(
            debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BlocProvider(
            create: (c)=>CovidBloc(),
            child: MyHomePage(title: 'Flutter Demo Home Page')),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidBloc _bloc ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<CovidBloc>(context);
    _bloc.add(CovidSummaryEvent());
    setMapInfo();

}
navigateToDetails(context ,point){

  Navigator.push(context, MaterialPageRoute(builder:(c)=> DetailsScreen(point)));
}

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 360,
          height: 690,
          child: BlocBuilder<CovidBloc , CovidState>(
            builder:(context,CovidState state){
              if(state.resultState == StateResult.loading){
                return Center(child: CircularProgressIndicator());
              }

              else if(state.resultState == StateResult.loaded)
             {
               print(state.circles.first.visible);
               return GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (c){
                    _controller.complete(c);
                  },
                  myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  circles: state.circles,
                   onTap: (point){
                    getDetailsOfPoint(context , state.summaryResult.countries , point);
                   },);
             }
            else {
             return Container();
              }
            }
            ),
          ),
        ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  setMapInfo() {
    _kGooglePlex = CameraPosition(
      target:
      LatLng(26.916034168934498,30.937367000000023),
      zoom: 1.4746,
    );
  }
  int counter =0 ;
  CameraPosition _kGooglePlex;

  void getDetailsOfPoint(context ,List<Country> countries, LatLng point)async {
    List<Placemark> list =await  placemarkFromCoordinates(point.latitude, point.longitude);
      print(list[0].country);
    for(var i in countries){
      if(list[0].country == i.country){
        navigateToDetails(context , i);
      }
    }
  }



}

