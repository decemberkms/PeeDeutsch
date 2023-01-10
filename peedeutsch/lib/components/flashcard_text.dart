import 'package:flutter/material.dart';

class FlashcardText extends StatelessWidget {
  final String text;

  const FlashcardText({Key? key, this.text = "No text"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
