import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
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
              Row(
                children: [
                  Expanded(
                    child: new Card(
                      child: Container(
                          padding: new EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Text("Hi"),
                            ],
                          )),
                    ),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
