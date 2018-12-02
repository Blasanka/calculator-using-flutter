import 'package:flutter/material.dart';
import 'cal_ui.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      // theme: new ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Calculator'),
        ),
        body: new Center(
          child: new Calculator(),
        ),
      ),
    );
  }
}