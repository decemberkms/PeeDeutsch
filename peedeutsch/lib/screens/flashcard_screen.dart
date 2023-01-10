import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:peedeutsch/components/flashcard_text.dart';

class FalshCardScreen extends StatefulWidget {
  // const FalshCardScreen({super.key});
  FalshCardScreen(this._flashcards);
  final List _flashcards;

  @override
  State<FalshCardScreen> createState() => _FalshCardScreenState();
}

class _FalshCardScreenState extends State<FalshCardScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool cardIsFlipped = false;
  void updateCardIsFlipped() => cardIsFlipped = !cardIsFlipped;
  int _currentIndex = 0;

  Future<void> nextQuestion() async {
    if (cardIsFlipped) {
      cardKey.currentState?.toggleCard();
    }
    await Future.delayed(const Duration(milliseconds: 200), () {
      // _currentIndex++;
    }); // needs time for the flip animation to complete before moving to the next question
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 400,
          child: FlipCard(
            speed: 0,
            direction: FlipDirection.VERTICAL,
            onFlip: () {
              updateCardIsFlipped();
            },
            front: FlashcardText(
              text: widget._flashcards[_currentIndex].question,
            ),
            back: FlashcardText(
              text: widget._flashcards[_currentIndex].answer,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton.icon(
                onPressed: () {
                  showPrevCar();
                },
                icon: const Icon(Icons.chevron_left),
                label: const Text("Prev")),
            OutlinedButton.icon(
                onPressed: () {
                  showNextCard();
                },
                icon: Icon(Icons.chevron_right),
                label: Text("Next"))
          ],
        )
      ],
    );
  }

  void showNextCard() {
    setState(() {
      // if (cardIsFlipped) {
      //   cardKey.currentState?.toggleCard();
      // }
      nextQuestion();
      _currentIndex = (_currentIndex + 1 < widget._flashcards.length)
          ? _currentIndex + 1
          : 0;
    });
  }

  void showPrevCar() {
    setState(() {
      nextQuestion();
      _currentIndex = (_currentIndex > 0)
          ? _currentIndex - 1
          : widget._flashcards.length - 1;
    });
  }

  // Right before the class scope
}
