import 'package:flutter/material.dart';

class BackFlashcardContentText extends StatelessWidget {
  // FlashcardContentText(this.cardColor, this.text = "No text");

  final Color? cardColor;
  final String text;
  final String thaiMeaning;

  const BackFlashcardContentText(
      {Key? key,
      this.cardColor,
      this.text = "No text",
      this.thaiMeaning = "None"})
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
              thaiMeaning,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
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
