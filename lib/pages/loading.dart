import 'package:flutter/material.dart';
import 'package:coviddailytracker/services/country_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupCountryData() async{
    Country instance = Country(location: 'Morocco',flag: 'morocco.png',url:'morocco');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'confirmed' : instance.confirmed,
      'deaths' : instance.deaths,
      'recovered' : instance.recovered,
    });
  }

  @override
  void initState() {
    super.initState();
    setupCountryData();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
