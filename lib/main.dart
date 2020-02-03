import 'package:flutter/material.dart';
import 'package:userapp/home_page.dart';
import 'package:userapp/pages/administrative/clients.dart';
import 'login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Color(0xFFE76112)
      ),
      home: Scaffold(
        body: Center(
        child: LoginPage(),
        )
      ),
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => new LoginPage(),
        '/clients' : (BuildContext context) => new Clients(),
        '/home-page' : (BuildContext context) => new HomePage(),
    },
    );
  }
}

