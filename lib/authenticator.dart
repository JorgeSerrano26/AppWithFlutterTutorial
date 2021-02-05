import 'package:flutter/material.dart';
import 'dart:async';

class Authenticator extends StatefulWidget {
  Authenticator({Key key, this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated; //Callback defined elsewhere

  @override
  State<StatefulWidget> createState() =>
      new _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {
  _AuthenticatorState({Key key, this.onAuthenticated});

  TextEditingController _user;
  TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;

  void _onClick() {
    if (_user.text != 'user' || _pass.text != '1234') {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _user = new TextEditingController();
    _pass = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(labelText: "Passoword"),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: _onClick,
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
