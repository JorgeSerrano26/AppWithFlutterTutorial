import 'package:flutter/material.dart';
import 'package:flutter_application_1/code/GlobalState.dart';

class Second extends StatefulWidget {
  Second(this.name);
  String name;

  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<Second> {
  _SecondState(this.name);
  String name;

  GlobalState _state = GlobalState.instance;
  
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
              Text("State: ${_state.get('name')}"),
              Text("State $name}"),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
