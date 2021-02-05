import 'package:flutter/material.dart';
import 'dart:async';
import 'timeDisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => new _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  Stopwatch _watch;
  Timer _timer;
  Duration _duration;
  List<Text> _times;

  void _onStart() {
    setState(() {
      _times = new List<Text>();
      _watch = new Stopwatch();
      _timer = new Timer.periodic(new Duration(milliseconds: 250), _onTimeOut);
    });
    _watch.start();
  }

  void _onStop() {
    _timer.cancel();
    _watch.stop();
  }

  void _onTimeOut(Timer timer) {
    if (!_watch.isRunning) return;
    setState(() {
      _duration = _watch.elapsed;
    });
  }

  void _saveTime() {
    setState(() {
      _times.add(new Text(
        "${(_times.length + 1)}. $_duration",
        style: TextStyle(fontSize: 20.0),
      ));
    });
  }

  void _onClear(Duration value) {
    setState(() {
      _duration = new Duration();
      _times = new List<Text>();
    });
  }

  @override
  void initState() {
    _duration = new Duration();
    _times = new List<Text>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      RaisedButton(onPressed: _onStart, child: Text('Start')),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(onPressed: _onStop, child: Text('Stop')),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      RaisedButton(onPressed: _saveTime, child: Text('Save')),
                ),
              ],
            ),
            Column(
              children: _times.reversed.toList(),
            )
          ],
        ),
      ),
    );
  }
}
