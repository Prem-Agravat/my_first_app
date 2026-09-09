import 'package:flutter/material.dart';
import 'package:my_first_app/inputcontrol/inputtextcontrol.dart';
import 'package:my_first_app/inputcontrol/radiobutton.dart';

void main() {
  runApp(const StopWatchRun());
}

class StopWatchRun extends StatelessWidget {
  const StopWatchRun({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RadioExample());
  }
}
