import 'package:flutter/material.dart';

class FrontFlashcardContentImage extends StatelessWidget {
  final String imageDir;
  final Color? cardColor;

  const FrontFlashcardContentImage(
      {Key? key, this.imageDir = 'No image', this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      // shadowColor: Colors.black,
      elevation: 13,
      child: CircleAvatar(
        backgroundColor: Color(0XFFE0F2F1),
        child: Image.asset(
          imageDir,
        ),
      ),
    );
  }
}
