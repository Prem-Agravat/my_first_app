import 'package:flutter/material.dart';
import 'package:my_first_app/resources/inpurtstring.dart';

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  final topics = [
    'Topic1',
    'Topic2',
    'Topic3',
    'Topic4',
    'Topic5',
    'Topic6',
    'Topic7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            for (final name in topics)
              Card(
                elevation: 20,
                color: Colors.blueGrey.shade400,
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
