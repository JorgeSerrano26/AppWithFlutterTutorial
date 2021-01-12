import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {
  List<MyItem> _items = new List<MyItem>();

  @override
  void initState() {
    for (var i = 0; i < 5; i++) {
      _items.add(MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Hello world'),
          )));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Header ${item.header}'),
          );
        },
        isExpanded: item.isExpanded,
        body: item.body);
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
              ExpansionPanelList(
                expansionCallback: (int i, bool isExpanded) {
                  setState(() {
                    _items[i].isExpanded = !_items[i].isExpanded;
                  });
                },
                children: _items.map(_createItem).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
