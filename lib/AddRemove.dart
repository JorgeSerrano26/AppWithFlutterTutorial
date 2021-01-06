import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  int counter = 0;
  List<Widget> _list = new List();

  @override
  void initState() {
    for (var i = counter; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
    counter = _list.length;
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
    setState(() => counter++);
  }

  Widget _newItem(int i) {
    Key key = new Key('item $i');
    Container child = new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text(
          '$i Name here',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delte',
        onDeleted: () => removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Text(
            i.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    return child;
  }

  void removeItem(Key key) {
    int i = 0;
    bool found = false;
    while (!found && i < _list.length) {
      if (_list.elementAt(i).key == key) {
        found = true;
        setState(() => _list.removeAt(i));
      }
      i++;
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
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
