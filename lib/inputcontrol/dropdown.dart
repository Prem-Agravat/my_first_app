import 'package:flutter/material.dart';

class DropDpwnExample extends StatefulWidget {
  const DropDpwnExample({super.key});

  @override
  State<DropDpwnExample> createState() => _DropDpwnExampleState();
}

class _DropDpwnExampleState extends State<DropDpwnExample> {
  String unit = 'Unit 1';

  void setDropDownValue() {
    setState(() {
      unit = 'Unit 3';
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
            DropdownButton(
              value: unit,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Unit 1', child: Text("Unit 1")),
                DropdownMenuItem(value: 'Unit 2', child: Text("Unit 2")),
                DropdownMenuItem(value: 'Unit 3', child: Text("Unit 3")),
                DropdownMenuItem(value: 'Unit 4', child: Text("Unit 4")),
              ],
              onChanged: (v) => setState(() {
                unit = v!;
              }),
            ),
            Text('Selected Unit: $unit'),
            ElevatedButton(
              onPressed: setDropDownValue,
              child: Text('Set to unit 3'),
            ),
          ],
        ),
      ),
    );
  }
}
