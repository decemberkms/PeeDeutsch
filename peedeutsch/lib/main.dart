import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/main_screen.dart';

void main(List<String> args) => runApp(Vocab());

class Vocab extends StatelessWidget {
  // const Vocab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amberAccent,
          scaffoldBackgroundColor: Colors.white),
      home: MainScreen(),
    );
  }
}
