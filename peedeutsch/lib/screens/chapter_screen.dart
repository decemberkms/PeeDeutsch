import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/vocab_screen.dart';
import 'package:peedeutsch/components/contents_holder.dart';
import 'package:peedeutsch/vocab/vocabStorage.dart';

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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          // Here index is the chapter
                          return VocabScreen(newList[index], index,
                              widget._vocabSet['Chapter 1']!);
                        },
                      ));
                    },
                  ),
                ],
              );
            }));
  }
}
