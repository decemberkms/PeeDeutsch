import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/vocab_screen.dart';

class ChapterScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  ChapterScreen(this.vocabLvl);
  final String vocabLvl;

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final List<String> chapters = <String>['A1 Niveau', 'A2 Niveau', 'B1 Niveau'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget.vocabLvl),
        ),
        body: ListView.separated(
            itemCount: chapters.length,
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
                        chapters[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VocabScreen(),
                          ));
                    },
                  ),
                ],
              );
            }));
  }
}
