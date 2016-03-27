import 'package:flutter/material.dart';
// import "LoginScreen.dart";
// import "DashboardScreen.dart";
// import "EventScreen.dart";
// import "AccountScreen.dart";
import "LoginScreen2.dart";
import "EventDetailsScreen.dart";

void main() {
  runApp(
    new MaterialApp(
      title: 'venue',
      routes: {
        '/': (BuildContext context) => new EventDetailsScreen(),
        // '/login': (BuildContext context) => new LoginScreen(),
        // '/event': (BuildContext context) => new EventScreen(),
        // '/account': (BuildContext context) => new AccountScreen(),
        // '/dashboard': (BuildContext context) => new DashboardScreen(),
      }
    )
  );
}
