import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Second.dart';
import 'package:flutter_application_1/screens/Third.dart';
import 'package:flutter_application_1/screens/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Navigation',
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new Home(),
          '/second': (BuildContext context) => new Second(),
          '/third': (BuildContext context) => new Third(),
        },
        home: new Home());
  }
}
