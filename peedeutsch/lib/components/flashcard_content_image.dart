import 'package:flutter/material.dart';

class FlashcardContentImage extends StatelessWidget {
  final String imageDir;
  final Color? cardColor;

  const FlashcardContentImage(
      {Key? key, this.imageDir = 'No image', this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      // shadowColor: Colors.black,
      elevation: 13,
      child: Image.asset(
        imageDir,
      ),
    );
  }
}
