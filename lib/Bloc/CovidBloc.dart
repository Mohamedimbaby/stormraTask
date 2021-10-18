import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storma_task/Bloc/CovidEvent.dart';
import 'package:storma_task/Bloc/CovidState.dart';
import 'package:storma_task/Models/SummaryModel.dart';
import 'package:storma_task/Repositories/CountriesRepositories.dart';

class CovidBloc extends Bloc<CovidEvent , CovidState>{
  CovidBloc() : super(CovidState(StateResult.initial));


  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async*{
    if (event is CovidSummaryEvent)
      {
        yield CovidState(StateResult.loading);
       try {
         SummaryModel summary = await CountriesRepositories.getSummary();
         var circles = await CountriesRepositories.drawCircles(summary.countries);
         yield CovidState.success(StateResult.loaded, summary,circles);
       }catch(exception ){
         yield CovidState.error(StateResult.error, exception.toString());
       }
      }
  }


}