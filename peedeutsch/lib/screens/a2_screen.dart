import 'package:flutter/material.dart';

class a2screen extends StatefulWidget {
  const a2screen({super.key});
  static const String id = 'a2_screen';

  @override
  State<a2screen> createState() => _a2screenState();
}

class _a2screenState extends State<a2screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [Text('a2 screen')],
        ),
      ),
    );
  }
}
