import 'package:flutter/material.dart';
import 'package:coviddailytracker/services/country_state.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Country> locations = [
    Country(url: 'morocco', location: 'morocco', flag: 'morocco.png'),
    Country(url: 'algeria', location: 'algeria', flag: 'uk.png'),
    Country(url: 'jordan', location: 'jordan', flag: 'greece.png'),
    Country(url: 'palestine', location: 'palestine', flag: 'egypt.png'),
    Country(url: 'syria', location: 'syria', flag: 'kenya.png'),
    Country(url: 'lebanon', location: 'lebanon', flag: 'usa.png'),
    Country(url: 'mauritania', location: 'mauritania', flag: 'usa.png'),
    Country(url: 'tunisia', location: 'tunisia', flag: 'south_korea.png'),
    Country(url: 'libya', location: 'libya', flag: 'indonesia.png'),
  ];

    void updateTime(index) async{

      Country instance = locations[index];
      await instance.getData();
      //Navigate to home Screen

      Navigator.pop(context, {
        'location': instance.location,
        'flag' : instance.flag,
        'time': instance.time,
        'confirmed' : instance.confirmed,
        'deaths' : instance.deaths,
        'recovered' : instance.recovered,
      });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
