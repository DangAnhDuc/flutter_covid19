import 'package:flutter_covid19/model/stats/cases.dart';
import 'package:flutter_covid19/services/network_services.dart';

class GlobalData{
  Cases cases;
  String url='https://thevirustracker.com/free-api?global=stats';
  Future<Cases>refresh() async{
    var data= await NetworkService.fetchData(url);
    List newData= data['results'];
    print(newData[0]['total_new_cases_today']);
    cases= Cases(total_cases: newData[0]['total_cases'],
        total_recovered: newData[0]['total_recovered'],
        total_unresolved: newData[0]['total_unresolved'],
        total_deaths: newData[0]['total_deaths'],
        total_new_cases_today: newData[0]['total_new_cases_today'],
        total_new_deaths_today: newData[0]['total_new_deaths_today'],
        total_active_cases: newData[0]['total_active_cases'],
        total_serious_cases: newData[0]['total_serious_cases'],
        total_affected_countries: newData[0]['total_affected_countries']);
//    newData.forEach((result) {
//      cases= Cases(total_cases: result['total_cases'],
//      total_recovered: result['total_recovered'],
//      total_unresolved: result['total_recovered'],
//      total_deaths: result['total_deaths'],
//      total_new_cases_today: result['total_new_cases_today'],
//      total_new_deaths_today: result['total_new_deaths_today'],
//      total_active_cases: result['total_active_cases'],
//      total_serious_cases: result['total_serious_cases'],
//      total_affected_countries: result['total_affected_countries']);
//    });
  return cases;
  }
}