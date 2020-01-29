import 'package:flutter/material.dart';
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
        home: Scaffold(
            // appBar: AppBar(title: Text('Prueba UpConta')),
            body: Center(
                child: LoginPage()
            )
        )
    );
  }
}
