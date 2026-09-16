import 'package:flutter/material.dart';
import 'package:my_first_app/inputcontrol/imagedisplay.dart';
import 'package:my_first_app/inputcontrol/scrollviewimage.dart';

void main() {
  runApp(const StopWatchRun());
}

class StopWatchRun extends StatelessWidget {
  const StopWatchRun({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ScrollImage());
  }
}
