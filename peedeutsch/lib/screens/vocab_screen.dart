import 'package:flutter/material.dart';

import 'package:peedeutsch/screens/flashcard_screen.dart';
import 'package:peedeutsch/components/contents_holder.dart';

class VocabScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  VocabScreen(this._selectedLektionIndex, this._selectedLektionString,
      this._selectedVocabList);

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
    print(widget._selectedLektionIndex);
    print(widget._selectedLektionString);
    print(widget._selectedVocabList[0].answer);
    print(widget._selectedVocabList[0].question);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget._selectedLektionString),
        ),
        body: FalshCardScreen(widget._selectedVocabList));
  }
}
