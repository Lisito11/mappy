import 'package:flutter/material.dart';
import 'package:mappy/src/screens/home_screen.dart';
import 'package:mappy/src/screens/map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mappy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "map": (context) => MapScreen(data: {},),
      },
    );
  }
}

