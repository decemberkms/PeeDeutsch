import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:peedeutsch/components/flashcard_content_text.dart';
import 'package:peedeutsch/components/common_fuctions.dart';

class FalshCardInnerScreen extends StatefulWidget {
  // const FalshCardScreen({super.key});
  FalshCardInnerScreen(
    this._vocabLvl,
    this._selectedLektionIndex,
    this._selectedLektionString,
    this._flashcards,
  );

  final String _vocabLvl;
  final int _selectedLektionIndex;
  final String _selectedLektionString;
  final List _flashcards;
  late int totalFlashCardNumber;

  @override
  State<FalshCardInnerScreen> createState() => _FalshCardInnerScreenState();
}

class _FalshCardInnerScreenState extends State<FalshCardInnerScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  bool cardIsFlipped = false;
  int _currentIndex = 0;
  double _percentage = 0;

  void updateCardIsFlipped() {
    cardIsFlipped = !cardIsFlipped;
  }

  Future<void> nextQuestion() async {
    if (cardIsFlipped) {
      cardKey.currentState?.toggleCard();
    }
    await Future.delayed(const Duration(milliseconds: 200), () {
      // _currentIndex++;
    }); // needs time for the flip animation to complete before moving to the next question
  }

  void initState() {
    // TODO: implement initState
    widget.totalFlashCardNumber = widget._flashcards.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                width: 350,
                // animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: _percentage,
                center: Text(
                  "${_currentIndex}/${widget.totalFlashCardNumber}",
                  style: TextStyle(color: Colors.black),
                ),
                barRadius: const Radius.circular(16),
                progressColor: Colors.blue.shade500,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          height: 500,
          child: FlipCard(
            key: cardKey,
            speed: 0,
            direction: FlipDirection.VERTICAL,
            onFlip: () {
              updateCardIsFlipped();
            },
            front: FlashcardContentText(
              text: widget._flashcards[_currentIndex].question,
              cardColor: Colors.amber,
            ),
            back: FlashcardContentText(
              text: widget._flashcards[_currentIndex].answer,
              cardColor: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              child: const Icon(
                MdiIcons.arrowLeftBold,
                size: 50.0,
              ),
              onPressed: () {
                showPrevCar();
              },
            ),
            OutlinedButton(
              child: const Icon(
                MdiIcons.arrowRightBold,
                size: 50.0,
              ),
              onPressed: () {
                showNextCard();
              },
            )
          ],
        )
      ],
    );
  }

  void showNextCard() {
    setState(() {
      if (cardKey.currentState != null) {
        if (!cardKey.currentState!.isFront) {
          cardKey.currentState!.toggleCard();
        }
      }
      nextQuestion();
      _currentIndex = (_currentIndex + 1 < widget._flashcards.length)
          ? _currentIndex + 1
          : 0;
      _percentage = _currentIndex / widget.totalFlashCardNumber;
    });
  }

  void showPrevCar() {
    setState(() {
      nextQuestion();
      _currentIndex = (_currentIndex > 0)
          ? _currentIndex - 1
          : widget._flashcards.length - 1;
      _percentage = _currentIndex / widget.totalFlashCardNumber;
    });
  }

  // Right before the class scope
}
