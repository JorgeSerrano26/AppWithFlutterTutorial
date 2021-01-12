import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Choice {
  final String title;
  final IconData icon;

  Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Choice> _items = <Choice>[
    Choice(title: "CAR", icon: Icons.directions_car),
    Choice(title: "BOAT", icon: Icons.directions_boat),
    Choice(title: "BUS", icon: Icons.directions_bus),
    Choice(title: "WALK", icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "My first app",
          style: new TextStyle(color: Colors.redAccent),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Theme(
            data: Theme.of(context),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(
                controller: _tabController,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _items.map((Choice item) {
          return Container(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(item.title),
                  Icon(
                    item.icon,
                    size: 120.0,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
