import 'package:flutter/material.dart';

class FlashcardText extends StatelessWidget {
  final String text;

  const FlashcardText({Key? key, this.text = "No text"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
