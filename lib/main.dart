import 'package:flutter/material.dart';
// import "LoginScreen.dart";
// import "DashboardScreen.dart";
// import "EventScreen.dart";
// import "AccountScreen.dart";
import "LoginScreen2.dart";
// import "EventDetailsScreen.dart";

const API_SERVER = "http://104.131.185.159:9000/";

void main() {

  // Connect to API
  

  // Start Application
  runApp(new MaterialApp(
    title:"Venue App",
    routes: {
      '/': (BuildContext context) => new LoginScreen2()
    }
  ));
}
