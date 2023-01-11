import 'package:flutter/material.dart';

class FlashcardContentImage extends StatelessWidget {
  final String imageDir;

  const FlashcardContentImage({Key? key, this.imageDir = 'No image'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CircleAvatar(
        backgroundImage: AssetImage(imageDir),
        radius: 60.0,
      ),
    );
  }
}
