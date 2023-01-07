import 'package:flutter/material.dart';

import 'package:peedeutsch/screens/main_screen.dart';

void main(List<String> args) => runApp(Vocab());

class Vocab extends StatelessWidget {
  const Vocab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
          primaryColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.white),
      home: MainScreen(),
    );
  }
}
