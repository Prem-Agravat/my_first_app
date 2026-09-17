import 'package:flutter/material.dart';
import 'package:my_first_app/resources/inpurtstring.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key});

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  Widget ScrollDisp() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: i2.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(i2[index]),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Image")),
      body: SafeArea(child: ScrollDisp()),
    );
  }
}
