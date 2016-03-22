import 'package:flutter/material.dart';

class LoginScreen extends StatefulComponent{
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  InputValue _username = InputValue.empty;
  InputValue _password = InputValue.empty;

  void _usernameChanged(InputValue query){
    setState((){
      _username = query;
    });
  }

  void _passwordChanged(InputValue query){
    setState((){
      _password = query;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text('Venue Login')
      ),
      body: new Container(
        margin: const EdgeDims.only(top: 100.0,left:50.0,right:50.0),
        child: new Column(
          children: [
            new Input(
              value: _username,
              hintText: "Username",
              onChanged: _usernameChanged
            ),
            new Input(
              value: _password,
              hideText: true,
              hintText: "Password",
              onChanged: _passwordChanged
            ),
            new FlatButton(
              color: new Color.fromARGB(255, 0xff, 0xcd, 0xd2),
              child: new Text("Login"),
              onPressed: (){
                Navigator.popAndPushNamed(context, "/dashboard");
              }
            )
          ]
        )
      )
    );
  }
}
