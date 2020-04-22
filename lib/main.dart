import 'package:flutter/material.dart';
import 'package:coviddailytracker/pages/choose_location.dart';
import 'package:coviddailytracker/pages/home.dart';
import 'package:coviddailytracker/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) =>Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

