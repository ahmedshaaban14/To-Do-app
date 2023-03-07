import 'package:flutter/material.dart';
import 'package:untitled/Bmi.dart';
import 'package:untitled/HomeS.dart';
import 'package:untitled/login.dart';
import 'package:untitled/ResultScreen.dart';
import 'package:untitled/themes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    themeMode: ThemeMode.dark,
    theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeS(),
    );

  }
}


