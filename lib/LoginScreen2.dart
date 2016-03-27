import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'DashboardScreen2.dart';

class LoginScreen2 extends StatefulWidget {
  LoginScreen2() : super();

  LoginScreen2State createState() => new LoginScreen2State();
}

class LoginScreen2State extends State<LoginScreen2> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<InputValue> _inputs = <InputValue>[
    InputValue.empty,
    InputValue.empty,
  ];

  Widget build(BuildContext context){
    return new Scaffold(
      appBarHeight: 128.0,
      appBar: new AppBar(
        flexibleSpace: (BuildContext context) {
          return new Container(
            padding: const EdgeInsets.only(left: 16.0, bottom: 24.0),
            height: 128.0,
            child: new Align(
              alignment: const FractionalOffset(0.0, 1.0),
              child: new Text('Venue Login', style: Typography.white.headline)
            )
          );
        }
      ),
      body: new Block(
        padding: const EdgeInsets.all(4.0),
        children: <Widget>[
            new Input(
              hintText: 'name@university.edu',
              labelText: 'Email',
              errorText: _validateEmail(_inputs[0]),
              value: _inputs[0],
              onChanged: (InputValue value) { _handleInputChanged(value, 0); }
            ),
            new Input(
              labelText: 'Password',
              errorText: _validatePassword(_inputs[1]),
              value: _inputs[1],
              hideText: true,
              onChanged: (InputValue value) { _handleInputChanged(value, 1); }
            ),
            new RaisedButton(
              child: new Text("Login"),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute<Null>(
                  builder: (BuildContext context) => new DashboardScreen2()
                ));
              }
            )
        ]
      )
    );
  }

  void _handleInputChanged(InputValue value, int which) {
    setState(() {
      _inputs[which] = value;
    });
  }

  String _validateEmail(InputValue value) {
    if (value.text.isEmpty)
      return 'Please enter your email.';
    return null;
  }

  String _validatePassword(InputValue value) {
    if (value.text.isEmpty)
      return 'Please enter your password.';
    return null;
  }
}
