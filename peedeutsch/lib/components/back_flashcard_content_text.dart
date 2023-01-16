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
              height: 50.0,
            ),
            Text(
              "Beispiel",
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
