import 'package:flutter/material.dart';
import "LoginScreen.dart";
import "DashboardScreen.dart";

void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter Demo',
      routes: <String, RouteBuilder>{
        '/': (RouteArguments args) => new LoginScreen(),
        '/login': (RouteArguments args) => new LoginScreen(),
        '/dashboard': (RouteArguments args) => new DashboardScreen(),
      }
    )
  );
}
