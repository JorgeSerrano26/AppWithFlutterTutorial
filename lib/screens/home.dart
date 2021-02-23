import 'package:flutter/material.dart';
import 'package:flutter_application_1/code/GlobalState.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    super.initState();
    _name = new TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed(){
    _store.set('name', _name.text);
    Navigator.of(context).pushNamed('/second');
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
              Text("Welcome home"),
              TextField(autofocus: true, controller: _name, decoration: InputDecoration(labelText: "Enter you name"),),
              RaisedButton(
                onPressed: _onPressed,
                child: Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
