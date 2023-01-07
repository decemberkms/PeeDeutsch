import 'package:flutter/material.dart';
import 'package:peedeutsch/screens/a1_screen.dart';
import 'package:peedeutsch/screens/a2_screen.dart';
import 'package:peedeutsch/screens/b1_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final List pages = [a1screen(), a2screen(), b1screen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('Deutsch Vocab'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
                onSurface: Colors.red,
              ),
              child: Text('Niveau ${entries[index]}'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pages[index],
                    ));
              },
            ),
          ]);
        },
      ),
    );
  }
}
