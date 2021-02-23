import 'package:flutter/material.dart';
import 'package:flutter_application_1/code/GlobalState.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second> {
  
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
              Text("Hello ${_state.get('name')}"),
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
