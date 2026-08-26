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
    return const Placeholder();
  }
}
