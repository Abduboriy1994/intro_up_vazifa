import 'package:flutter/material.dart';
import 'package:intro_up_vazifa/home_page.dart';
import 'package:intro_up_vazifa/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        IntroPage.id:(context)=>IntroPage(),
      },
    );
  }
}

