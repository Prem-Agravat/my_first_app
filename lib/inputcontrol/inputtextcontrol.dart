import 'package:flutter/material.dart';

class ControlInput extends StatefulWidget {
  const ControlInput({super.key});

  @override
  State<ControlInput> createState() => _ControlInputState();
}

class _ControlInputState extends State<ControlInput> {
  final textcontroller = TextEditingController();

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  void setTextValue() {
    setState(() {
      textcontroller.text = "Hello World";
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
            TextField(
              controller: textcontroller,
              decoration: const InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 20),
            Text('Read : ${textcontroller.text}'),
            ElevatedButton(
              onPressed: setTextValue,
              child: const Text('Set Text'),
            ),
          ],
        ),
      ),
    );
  }
}
