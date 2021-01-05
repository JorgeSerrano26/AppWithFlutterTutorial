import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

enum Answers { YES, NO, MAYBE }

class _State extends State<MyApp> {
  String _value = '';
  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch (await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text("Do you like flutter?"),
          children: <Widget>[
            new SimpleDialogOption(
              onPressed: () => Navigator.pop(context, Answers.YES),
              child: Text("Yes"),
            ),
            new SimpleDialogOption(
              onPressed: () => Navigator.pop(context, Answers.NO),
              child: Text("No"),
            ),
            new SimpleDialogOption(
              onPressed: () => Navigator.pop(context, Answers.MAYBE),
              child: Text("Maybe?"),
            ),
          ],
        ))) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
      case Answers.MAYBE:
        _setValue('Maybe');
        break;
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
          child: new Column(
            children: <Widget>[
              Text(_value),
              RaisedButton(
                onPressed: _askUser,
                child: Text("Ask me!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
