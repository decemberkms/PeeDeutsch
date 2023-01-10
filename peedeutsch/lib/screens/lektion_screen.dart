import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/vocab_screen.dart';
import 'package:peedeutsch/components/contents_holder.dart';

class LektionScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  LektionScreen(this.vocabLvl, this._selectedLevel, this._vocabSet);
  final String vocabLvl;
  final int _selectedLevel;
  final Map<String, List<ContentHolder>> _vocabSet;

  @override
  State<LektionScreen> createState() => _LektionScreenState();
}

class _LektionScreenState extends State<LektionScreen> {
  late List selectedLektionListString;
  late String selectedLektionNumber;

  @override
  void initState() {
    // TODO: implement initState
    selectedLektionListString = widget._vocabSet.keys.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget.vocabLvl),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: Colors.black,
                ),
            itemCount: selectedLektionListString.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          selectedLektionListString[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (index == 0) {
                          selectedLektionNumber = 'Lektion 1';
                        } else if (index == 1) {
                          selectedLektionNumber = 'Lektion 2';
                        } else if (index == 2) {
                          selectedLektionNumber = 'Lektion 3';
                        } else if (index == 3) {
                          selectedLektionNumber = 'Lektion 4';
                        } else if (index == 4) {
                          selectedLektionNumber = 'Lektion 5';
                        } else if (index == 5) {
                          selectedLektionNumber = 'Lektion 6';
                        } else if (index == 6) {
                          selectedLektionNumber = 'Lektion 7';
                        } else if (index == 7) {
                          selectedLektionNumber = 'Lektion 8';
                        }
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            // Here index is the chapter
                            return VocabScreen(
                              index,
                              selectedLektionNumber,
                              widget._vocabSet[selectedLektionNumber]!,
                            );
                          },
                        ));
                      },
                    ),
                  ],
                ),
              );
            }));
  }
}
