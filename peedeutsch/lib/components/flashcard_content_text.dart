import 'package:flutter/material.dart';

class FlashcardContentText extends StatelessWidget {
  final String text;

  const FlashcardContentText({Key? key, this.text = "No text"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 13,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 23.0,
          ),
        ),
      ),
    );
  }
}
