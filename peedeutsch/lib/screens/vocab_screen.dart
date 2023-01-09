import 'package:flutter/material.dart';
import 'package:peedeutsch/components/contents_holder.dart';

class VocabScreen extends StatefulWidget {
  // const VocabScreen({super.key});

  VocabScreen(this.level, this._selectedChapter, this._selectedVocabList);
  final String level;
  final int _selectedChapter;
  final List<ContentHolder> _selectedVocabList;

  @override
  State<VocabScreen> createState() => _VocabScreenState();
}

class _VocabScreenState extends State<VocabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
