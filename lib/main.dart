import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/random_words/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
      theme: new ThemeData(
          primaryColor: Colors.white, accentColor: Colors.deepOrange),
    );
  }
}
