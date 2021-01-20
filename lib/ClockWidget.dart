import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<ClockWidget> {
  String _time = 'Time here';
  Timer _timer;

  @override
  void initState() {
    _timer = new Timer.periodic(new Duration(seconds: 1), _onTimer);
    super.initState();
  }

  void _onTimer(Timer timer) {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() {
      _time = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: TextStyle(fontSize: 32.0),
    );
  }
}
