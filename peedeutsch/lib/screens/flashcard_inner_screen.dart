import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:peedeutsch/components/flashcard_content_text.dart';

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
  void initState() {
    // TODO: implement initState
    widget.totalFlashCardNumber = widget._flashcards.length;
    super.initState();
  }

  double _percentage = 0;

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
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
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
                // linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          height: 550,
          child: FlipCard(
            speed: 0,
            direction: FlipDirection.VERTICAL,
            onFlip: () {
              updateCardIsFlipped();
            },
            front: FlashcardContentText(
              text: widget._flashcards[_currentIndex].question,
            ),
            back: FlashcardContentText(
              text: widget._flashcards[_currentIndex].answer,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              child: Icon(
                MdiIcons.arrowLeftBold,
                size: 50.0,
              ),
              onPressed: () {
                showPrevCar();
              },
            ),
            OutlinedButton(
              child: Icon(
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
      // if (cardIsFlipped) {
      //   cardKey.currentState?.toggleCard();
      // }

      nextQuestion();
      _currentIndex = (_currentIndex + 1 < widget._flashcards.length)
          ? _currentIndex + 1
          : 0;
      _percentage = _currentIndex / widget.totalFlashCardNumber;
      _percentage = _percentage.toPrecision(2);
      print(_percentage);
    });
  }

  void showPrevCar() {
    setState(() {
      nextQuestion();
      _currentIndex = (_currentIndex > 0)
          ? _currentIndex - 1
          : widget._flashcards.length - 1;
      _percentage = _currentIndex / widget.totalFlashCardNumber;
      _percentage = _percentage.toPrecision(2);
      print(_percentage);
    });
  }

  // Right before the class scope
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
