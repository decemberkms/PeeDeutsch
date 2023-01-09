import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/vocab_screen.dart';
import 'package:peedeutsch/components/contents_holder.dart';

class ChapterScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  ChapterScreen(this.vocabLvl, this._selectedLevel, this._vocabSet);
  final String vocabLvl;
  final int _selectedLevel;
  final Map<String, List<ContentHolder>> _vocabSet;

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late List newList;
  late String selectedchapterNumber;

  @override
  void initState() {
    // TODO: implement initState
    newList = widget._vocabSet.keys.toList();
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
            itemCount: newList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        newList[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (index == 0) {
                        selectedchapterNumber = 'Chapter 1';
                      } else if (index == 1) {
                        selectedchapterNumber = 'Chapter 2';
                      } else if (index == 2) {
                        selectedchapterNumber = 'Chapter 3';
                      } else if (index == 3) {
                        selectedchapterNumber = 'Chapter 4';
                      }
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          // Here index is the chapter
                          return VocabScreen(
                              newList[index],
                              index,
                              selectedchapterNumber,
                              widget._vocabSet[selectedchapterNumber]!);
                        },
                      ));
                    },
                  ),
                ],
              );
            }));
  }
}
