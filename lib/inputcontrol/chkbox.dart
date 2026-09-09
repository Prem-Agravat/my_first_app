import 'package:flutter/material.dart';

class ChkBoxDemo extends StatefulWidget {
  const ChkBoxDemo({super.key});

  @override
  State<ChkBoxDemo> createState() => _ChkBoxDemoState();
}

class _ChkBoxDemoState extends State<ChkBoxDemo> {
  bool ischecked = false;

  void UpdateChkBox() {
    setState(() {
      ischecked = !ischecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: const Text("Check Box"),
              value: ischecked,
              onChanged: (v) => {
                setState(() {
                  ischecked = v!;
                }),
              },
            ),
            Text('Read ${ischecked ? 'Agree' : 'Disagree'}'),
            ElevatedButton(
              onPressed: UpdateChkBox,
              child: const Text("Agree / Disagree"),
            ),
          ],
        ),
      ),
    );
  }
}
