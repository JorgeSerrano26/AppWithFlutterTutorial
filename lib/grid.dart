import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: "Area", this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {
  int _location;
  bool won = false;
  List<Area> _areas;

  @override
  void initState() {
    _areas = new List<Area>();
    for (int i = 0; i < 16; i++) {
      _areas.add(new Area(index: i, name: 'Area $i'));
    }
    var rng = new Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget generate(int index) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _onPressed(int i) {
    if (!won) {
      setState(() {
        if (i == _location) {
          _areas[i].color = Colors.greenAccent;
          won = true;
        } else {
          _areas[i].color = Colors.redAccent;
        }
      });
    }
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
          child: GridView.count(
            crossAxisCount: 4,
            children: new List<Widget>.generate(16, generate),
          ),
        ),
      ),
    );
  }
}
