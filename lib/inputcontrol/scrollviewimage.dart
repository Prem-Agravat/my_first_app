import 'package:flutter/material.dart';
import 'package:my_first_app/resources/inpurtstring.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key});

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  Widget ScrollDips() {
    return SafeArea(
      child: SizedBox(
        height: 700,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: i2.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(i2[index]),
                    height: 200,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Text("This Image"),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Image")),
      body: SafeArea(child: ScrollDips()),
    );
  }
}
