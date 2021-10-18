import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storma_task/Models/CountryModel.dart';
import 'package:storma_task/utils/Strings.dart';
import 'package:storma_task/utils/Styles.dart';

class DetailsScreen extends StatefulWidget {
Country point;

DetailsScreen(this.point);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    DateTime parse = dateFormat.parse(widget.point.Date);
    String format = dateFormat.format(parse);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.point.country),
        centerTitle: true,

      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
         children: [
           itemDesign(TheDateForStatus,format),
           itemDesign(NewDeaths, widget.point.NewDeaths.toString()),
           itemDesign(NewRecoovered, widget.point.NewRecovered.toString()),
           itemDesign(NewConfirmed, widget.point.NewConfirmed.toString()),
           itemDesign(TotalConfirmed, widget.point.TotalConfirmed.toString()),
           itemDesign(TotalDeaths, widget.point.TotalDeaths.toString()),
           itemDesign(TotalRecovered, widget.point.TotalRecovered.toString()),
         ],
        )
      ),
    );
  }
  itemDesign (text , theValue){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: headLine,),
        Text(theValue, style: value,),
      ],
    );
  }
}

