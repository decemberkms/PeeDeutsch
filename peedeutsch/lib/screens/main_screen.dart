import 'package:flutter/material.dart';
// import 'package:peedeutsch/screens/a1_screen.dart';
// import 'package:peedeutsch/screens/a2_screen.dart';
// import 'package:peedeutsch/screens/b1_screen.dart';
import 'package:peedeutsch/screens/chapter_screen.dart';

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
  // final List pages = [a1screen(), a2screen(), b1screen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text(
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
                            builder: (context) => ChapterScreen(entries[index]),
                          ));
                    },
                  ),
                ]),
          );
        },
      ),
    );
  }
}
