import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

enum Animals { Cat, Dog, Bird, Fish }

class _State extends State<MyApp> {
  Animals selected = Animals.Cat;
  String _value = 'Make a selection';
  List<PopupMenuEntry<Animals>> items = new List();

  @override
  void initState() {
    for (Animals animal in Animals.values) {
      items.add(new PopupMenuItem(
        child: Text(_getDisplay(animal)),
        value: animal,
      ));
    }
  }

  void _onSelect(Animals animal) {
    setState(() {
      selected = animal;
      _value = "You selected ${_getDisplay(animal)}";
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf(".");
    index++;
    return animal.toString().substring(index);
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
              Container(
                padding: EdgeInsets.all(12.0),
                child: Text(_value),
              ),
              PopupMenuButton<Animals>(
                child: Icon(Icons.input),
                onSelected: _onSelect,
                itemBuilder: (BuildContext context) {
                  return items;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
