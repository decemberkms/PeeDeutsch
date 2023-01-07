import 'package:flutter/material.dart';

class b1screen extends StatefulWidget {
  const b1screen({super.key});
  static const String id = 'b1_screen';

  @override
  State<b1screen> createState() => _b1screenState();
}

class _b1screenState extends State<b1screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('B1 Niveau'),
      ),
      body: Center(
        child: Column(
          children: [Text('b1 screen')],
        ),
      ),
    );
  }
}
