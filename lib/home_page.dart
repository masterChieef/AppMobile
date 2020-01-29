import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main_options.dart';

class HomePageRoute extends CupertinoPageRoute {
  HomePageRoute()
    : super(builder: (BuildContext context) => new HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainOptions();
  }
}
