import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  //print('From Home page - $data');

  //set Background
  String bgImage = 'bg2.jpg';
  Color bgColor =  Colors.grey[900];
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      print("Button Flat ->${result['location']}");
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location' : result['location'],
                          'flag' : result['flag'],
                          'confirmed' : result['confirmed'],
                          'deaths' : result['deaths'],
                          'recovered' : result['recovered'],
                        };
                       // print('setState fun - > ${result['confirmed']}');
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        data['location'],
                      style: TextStyle(
                        fontSize: 60.0,
                        letterSpacing: 2.0,
                        color:Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Confirmed : ${data['confirmed']}',
                  style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.white,
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Deaths : ${data['deaths']}',
                  style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Recovered : ${data['recovered']}',
                  style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.white,
                  ),
                ),
              ],

            ),
          ),
        ),

      ),
    );
  }
}
