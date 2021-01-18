import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {
  List<Sales> laptops;
  List<Sales> desktops;
  List<charts.Series<Sales, String>> _chartdata;

  void makeData() {
    laptops = new List<Sales>();
    desktops = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    for (int i = 2010; i < 2015; i++) {
      laptops.add(new Sales(i.toString(), rnd.nextInt(1000)));
      desktops.add(new Sales(i.toString(), rnd.nextInt(1000)));
    }

    _chartdata.add(new charts.Series(
        id: "Sales",
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: laptops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        displayName: 'sales'));
    _chartdata.add(new charts.Series(
        id: "Sales",
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        data: desktops,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        displayName: 'sales'));
  }

  @override
  void initState() {
    makeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "My first app",
          style: new TextStyle(color: Colors.redAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text('Sales data'),
              Expanded(
                child: new charts.BarChart(_chartdata),
              )
            ],
          ),
        ),
      ),
    );
  }
}
