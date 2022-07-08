import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sama/weatherclass/forecastclass.dart';
import 'package:sama/weatherclass/weatherdata.dart';

class Helper extends ChangeNotifier{

  bool isDay=true;    //Day Tracker
  // var lat=33.4;
  // var long= -94.04;
  String currentCity="delhi"; //Current City
  List<Forecast> forecastData=[];


  CurrentWeather currentWeather=CurrentWeather(time:'NA',city: 'NA',temperature: 'NA',condition: 'NA');


  Future<String?>  getCureentWeather(Helper helper) async{                                        //Get Present Weather
    try {
      var urlCurrent = Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=187fcbbb0d5d43b8bd340813223006&q=${helper
              .currentCity}');
      var urlForecast =Uri.parse("https://api.weatherapi.com/v1/forecast.json->hour?key=187fcbbb0d5d43b8bd340813223006&q=${helper.currentCity}");

      var responseCurrent = await http.get(urlCurrent);
      var responseForecast = await http.get(urlForecast);

      var jsonResponseCurrent = jsonDecode(responseCurrent.body) as Map<String, dynamic>;
      var jsonResponseForecast = jsonDecode(responseForecast.body) as Map<String, dynamic>;

      helper.currentWeather=CurrentWeather(time:'NA',city: 'NA',temperature: 'NA',condition: 'NA');
      helper.currentWeather = CurrentWeather(
         time: jsonResponseCurrent['location']['localtime'].toString(),
          city: jsonResponseCurrent['location']['name'].toString(),
          condition: jsonResponseCurrent['current']['condition']['text'].toString(),
          temperature: jsonResponseCurrent['current']['temp_c'].toString());

      for(var i in jsonResponseForecast['forecast']['forecastday'].first['hour']){
        helper.forecastData.add(Forecast(time: i['time'].toString().substring(11), icon:i['condition']['icon'], temp:i['temp_c'].toString()));
      }

      String ti="0";

      if(helper.currentWeather.time.substring(11,13).endsWith(":")){
        ti=helper.currentWeather.time.substring(11,12);
      }
      else {
        ti = helper.currentWeather.time.substring(11, 13);
      }
      if(double.parse(ti)>=18) {
        helper.isDay = false;
      }
      return null;
    }
    catch(e){
        return e.toString();
    }
    }

  void messageShow(BuildContext context, bool good, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: good ? Colors.blue : Colors.red,
        content: SizedBox(
          height: 15,
          child: Center(
            child: Text(text),
          ),
        )));
  }

}