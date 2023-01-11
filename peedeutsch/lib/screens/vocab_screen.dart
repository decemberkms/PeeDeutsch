import 'package:flutter/material.dart';

import 'package:peedeutsch/screens/flashcard_inner_screen.dart';
import 'package:peedeutsch/components/contents_holder.dart';

class VocabScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  VocabScreen(this._vocabLvl, this._selectedLektionIndex,
      this._selectedLektionString, this._selectedVocabList);
  final String _vocabLvl;
  final int _selectedLektionIndex;
  final String _selectedLektionString;
  final List<ContentHolder> _selectedVocabList;

  @override
  State<VocabScreen> createState() => _VocabScreenState();
}

class _VocabScreenState extends State<VocabScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget._selectedLektionString),
        ),
        body: FalshCardInnerScreen(
            widget._vocabLvl,
            widget._selectedLektionIndex,
            widget._selectedLektionString,
            widget._selectedVocabList));
  }
}
