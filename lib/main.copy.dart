import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value = "";
  bool _isCheked = false;
  int _radioValue = 0;
  bool _isActivated = false;
  double _sliderValue = 0.0;
  String _date = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2021));
    if (picked != null) setState(() => _date = picked.toString());
  }

  void _onChange(String v) => setState(() => _value = 'Change: $v');
  void _setRadioValue(int val) => setState(() => _radioValue = val);
  void _changeSwitch(bool val) => setState(() => _isActivated = val);
  void _setSliderValue(double v) => setState(() => _sliderValue = v);

  Widget makeRadiosTitle() {
    List<Widget> list = new List();

    for (int i = 0; i < 3; i++) {
      int position = i + 1;
      list.add(new RadioListTile(
        value: i,
        groupValue: _radioValue,
        onChanged: _setRadioValue,
        title: new Text('Item $position'),
        subtitle: new Text('Mi subtitulo $position'),
      ));
    }

    Column column = new Column(
      children: list,
    );

    return column;
  }

  void _onChecked(bool value) => setState(() {
        _isCheked = value;
      });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Hello world, down")),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Radio value $_radioValue'),
              new Text(_value),
              new TextField(
                decoration: new InputDecoration(
                    labelText: 'hello',
                    hintText: 'Hint',
                    icon: new Icon(Icons.people)),
                onChanged: _onChange,
                autocorrect: true,
                keyboardType: TextInputType.number,
              ),
              new CheckboxListTile(
                value: _isCheked,
                onChanged: _onChecked,
                title: new Text(_isCheked ? 'Checked' : 'Not checked'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text("mi checkbox"),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.amber,
              ),
              makeRadiosTitle(),
              new SwitchListTile(
                value: _isActivated,
                onChanged: _changeSwitch,
                title: new Text("My switch"),
                subtitle: new Text("My switch subtitle"),
              ),
              new Text('Value ${(_sliderValue * 100).round().toString()}'),
              new Slider(
                value: _sliderValue,
                onChanged: _setSliderValue,
              ),
              new Text('Date $_date'),
              new RaisedButton(
                onPressed: _selectDate,
                child: new Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
