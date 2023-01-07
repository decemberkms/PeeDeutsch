import 'package:flutter/material.dart';

class a1screen extends StatefulWidget {
  const a1screen({super.key});
  static const String id = 'a1_screen';

  @override
  State<a1screen> createState() => _a1screenState();
}

class _a1screenState extends State<a1screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('A1 Niveau'),
      ),
      body: Center(
        child: Column(
          children: [Text('a1 screen')],
        ),
      ),
    );
  }
}
