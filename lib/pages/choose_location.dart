import 'package:flutter/material.dart';
import 'package:coviddailytracker/services/country_state.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Country> locations = [
    Country(url: 'morocco', location: 'Morocco', flag: 'morocco.png'),
    Country(url: 'algeria', location: 'Algeria', flag: 'algeria.png'),
    Country(url: 'jordan', location: 'Jordan', flag: 'jordan.png'),
    Country(url: 'palestine', location: 'Palestine', flag: 'palestine.png'),
    Country(url: 'syria', location: 'Syria', flag: 'syria.png'),
    Country(url: 'lebanon', location: 'Lebanon', flag: 'lebanon.png'),
    Country(url: 'mauritania', location: 'Mauritania', flag: 'mauritania.png'),
    Country(url: 'tunisia', location: 'Tunisia', flag: 'tunisia.png'),
    Country(url: 'libya', location: 'Libya', flag: 'libya.png'),
  ];

    void updateData(index) async{

      Country instance = locations[index];
      await instance.getData();
      print('instance updateData - > ${instance.countryName}');
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
        backgroundColor: Colors.grey[900],
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
                    updateData(index);
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
