import 'package:flutter/material.dart';

class FlashcardImage extends StatelessWidget {
  final String imageDir;

  const FlashcardImage({Key? key, this.imageDir = 'No image'})
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
