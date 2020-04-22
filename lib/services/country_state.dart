import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Country {
  String location; // location name for the UI
  String time;// the last time update states in that location
  String flag; // url for an asset flag icon
  String url ; // location url for api endpoint
  String countryName ;
  String confirmed ;
  String deaths ;
  String recovered;

  Country({this.location,this.flag, this.url});

  Future<void> getData() async{
    try{
      //make the request
      Response response = await get('https://api.covid19api.com/country/$url');

      List parsedList = jsonDecode(response.body);
      Map data = parsedList[parsedList.length-1]; //get the last data of that country
      print('Lol  $data');

      //get properties from data
       countryName = data['Country'];
       confirmed = data['Confirmed'].toString();
       deaths = data['Deaths'].toString();
       recovered = data['Recovered'].toString();
      String datetime = data['Date'];
      // print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);

      //set and format the time  property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error $e');
      time = 'could not get time data';
    }




  }
}