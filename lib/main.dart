import 'package:flutter/material.dart';
import 'package:flutter_application_1/TimeCounter.dart';
import 'package:flutter_application_1/authenticator.dart';
import 'mywidget.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  bool _isAuthenticated;

  void _onAuthenticated(bool value) {
    print("Value $value");
    setState(() => _isAuthenticated = value);
  }

  @override
  void initState() {
    _isAuthenticated = false;
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
              MyWidget(),
              Authenticator(
                onAuthenticated: _onAuthenticated,
              ),
              _isAuthenticated ? TimeCounter() : Text("Not authenticated")
            ],
          ),
        ),
      ),
    );
  }
}
