import 'package:flutter/material.dart';
import "LoginScreen2.dart";
import "DashboardScreen2.dart";

void main() {
  print("\n\n\n---------------------------------------------\n\n");

  // Start Application
  runApp(new MaterialApp(
    title:"Venue App",
    routes: {
      '/': (BuildContext context) => new LoginScreen2(),
      '/dashboard': (BuildContext context) => new DashboardScreen2(),
    }
  ));
}
