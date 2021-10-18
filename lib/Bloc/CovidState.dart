import 'dart:collection';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storma_task/Models/SummaryModel.dart';

class CovidState {
  StateResult resultState;
  SummaryModel summaryResult ;
  HashSet<Circle> circles ;
  String errorMessage ;

  CovidState( this.resultState);
  CovidState.error( this.resultState,this.errorMessage);
  CovidState.success( this.resultState,this.summaryResult,this.circles);

}
enum StateResult {
  loading, loaded , error , initial
}