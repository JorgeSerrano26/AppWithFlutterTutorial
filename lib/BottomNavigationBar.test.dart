import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  List<BottomNavigationBarItem> _items;
  String _value = "";
  int _index = 0;

  void _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext ctx) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Some info here"),
                new RaisedButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: new Text('Close'))
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _items = new List();
    _items.add(
        new BottomNavigationBarItem(icon: new Icon(Icons.movie), label: ""));
    _items.add(
        new BottomNavigationBarItem(icon: new Icon(Icons.search), label: ""));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.favorite_border_outlined),
        label: "",
        activeIcon: new Icon(Icons.favorite)));
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
              new Text(
                _value,
                style: new TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        fixedColor: Colors.redAccent,
        currentIndex: _index,
        onTap: (int i) {
          setState(() {
            _index = i;
            _value = 'Current index $_index';
          });
        },
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
