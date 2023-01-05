import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  // const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('Deutsch Vocab'),
      ),
      body: Container(
        child: Text("Body"),
      ),
    );
  }
}
