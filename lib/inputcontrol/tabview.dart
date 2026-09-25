import 'package:flutter/material.dart';
import 'package:my_first_app/inputcontrol/gridview.dart';
import 'package:my_first_app/inputcontrol/scrollviewimage.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'GridView'),
              Tab(icon: Icon(Icons.settings), text: 'Scroll_img_1'),
              Tab(icon: Icon(Icons.message_sharp), text: 'Scroll_img_2'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: GridExample()),
            Center(child: ScrollImage()),
            Center(child: ScrollImage()),
          ],
        ),
      ),
    );
  }
}
