import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:peedeutsch/components/front_flashcard_content_image.dart';
import 'package:peedeutsch/components/front_flashcard_content_text.dart';
import 'package:peedeutsch/components/back_flashcard_content_text.dart';

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
    _percentage = 1 / widget.totalFlashCardNumber;
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
                // animationDuration: 2500,
                lineHeight: 20.0,
                percent: _percentage,
                center: Text(
                  "${_currentIndex + 1}/${widget.totalFlashCardNumber}",
                  style: const TextStyle(color: Colors.black),
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
            front: (widget._flashcards[_currentIndex].type == "text")
                ? FrontFlashcardContentText(
                    text: widget._flashcards[_currentIndex].question,
                    cardColor: const Color.fromARGB(255, 229, 221, 244),
                  )
                : FrontFlashcardContentImage(
                    // tpye == "image"
                    imageDir: widget._flashcards[_currentIndex].imagePath,
                    cardColor: const Color.fromARGB(255, 229, 221, 244),
                  ),
            back: BackFlashcardContentText(
              text: widget._flashcards[_currentIndex].answer,
              cardColor: const Color(0xFFE8F5E9),
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
                if (_currentIndex == 0) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warnung'),
                        content: const Text('Diese Karte ist die erste.'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Okay'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showPrevCar();
                }
              },
            ),
            OutlinedButton(
              child: const Icon(
                MdiIcons.arrowRightBold,
                size: 50.0,
              ),
              onPressed: () {
                if (_currentIndex == (widget.totalFlashCardNumber - 1)) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warnung'),
                        content: const Text(
                            'Diese Karte ist die letzte. Möchten Sie zur ersten Karte zurückgehen?'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Okay'),
                            onPressed: () {
                              showNextCard();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Nein'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showNextCard();
                }
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
      if (_currentIndex + 1 < widget._flashcards.length) {
        _currentIndex += 1;
      } else {
        _currentIndex = 0;
      }
      // _currentIndex = (_currentIndex + 1 < widget._flashcards.length)
      //     ? _currentIndex + 1
      //     : 0;
      _percentage = (_currentIndex + 1) / widget.totalFlashCardNumber;
    });
  }

  void showPrevCar() {
    setState(() {
      nextQuestion();
      if (_currentIndex > 0) {
        _currentIndex -= 1;
      } else {
        _currentIndex = widget._flashcards.length - 1;
      }
      // _currentIndex = (_currentIndex > 0)
      //     ? _currentIndex - 1
      //     : widget._flashcards.length - 1;
      _percentage = (_currentIndex + 1) / widget.totalFlashCardNumber;
    });
  }

  // Right before the class scope
}
