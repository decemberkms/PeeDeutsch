import 'package:flutter/material.dart';

import 'package:peedeutsch/components/contents_holder.dart';
import 'package:peedeutsch/vocab/vocabStorageA1.dart';
import 'package:peedeutsch/vocab/vocabStorageA2.dart';
import 'package:peedeutsch/vocab/vocabStorageB1.dart';
import 'package:peedeutsch/screens/lektion_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> entries = <String>['A1 Niveau', 'A2 Niveau', 'B1 Niveau'];
  final List colorCodes = [
    Colors.purple.shade200,
    Colors.blue.shade200,
    Colors.green.shade200
  ];

  late Map<String, List<ContentHolder>> vocabSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: const Text(
          'Deutsch Vocab',
          style: TextStyle(
            fontSize: 25.0,
            wordSpacing: 3.0,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: colorCodes[index],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        entries[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (index == 0) {
                        vocabSet = VocabDictA1.a1Vocab;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // Index also shows the selected Level : 0->A1, 1->A2, 2->B1
                              return LektionScreen(
                                  entries[index], index, vocabSet);
                            },
                          ),
                        );
                      } else if (index == 1) {
                        // temp blocking A2
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Warnung'),
                              content: const Text('Im Bau.'),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
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
                        vocabSet = VocabDictA2.a2Vocab;
                      } else if (index == 2) {
                        // temp blocking B1
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Warnung'),
                              content: const Text('Im Bau.'),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
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
                        vocabSet = VocabDictB1.b1Vocab;
                      }
                      //navigator should be here after a2 and b1 completed
                    },
                  ),
                ]),
          );
        },
      ),
    );
  }
}
