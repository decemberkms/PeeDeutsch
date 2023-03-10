import 'package:flutter/material.dart';

class FrontFlashcardContentText extends StatelessWidget {
  // FlashcardContentText(this.cardColor, this.text = "No text");

  final Color? cardColor;
  final String text;

  const FrontFlashcardContentText(
      {Key? key, this.cardColor, this.text = "No text"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shadowColor: Colors.black,
      elevation: 13,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 23.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
