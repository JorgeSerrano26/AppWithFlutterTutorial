import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  List<Step> _steps;
  List<Map> _stepsData = [
    {"title": "Do something", "isActive": true},
    {"title": "Do something 2", "isActive": false},
    {"title": "Do something 3", "isActive": false}
  ];
  int _current;

  @override
  void initState() {
    _steps = new List();
    _current = 0;

    for (var stepdata in _stepsData) {
      int i = 1;
      _steps.add(Step(
          content: Text(stepdata['title']),
          title: Text("Step"),
          isActive: stepdata['isActive']));
      i++;
    }
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
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
            child: Stepper(
          steps: _steps,
          type: StepperType.vertical,
          currentStep: _current,
          onStepCancel: _stepCancel,
          onStepContinue: _stepContinue,
          onStepTapped: _stepTap,
        )),
      ),
    );
  }
}
