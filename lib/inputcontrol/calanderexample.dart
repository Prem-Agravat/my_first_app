import 'package:flutter/material.dart';

class CalendExample extends StatefulWidget {
  const CalendExample({super.key});

  @override
  State<CalendExample> createState() => _CalendExampleState();
}

class _CalendExampleState extends State<CalendExample> {
  DateTime? data;

  Future<void> pickData() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (!mounted || picked == null) return;
    setState(() => data = picked);
  }

  void setDateValue() {
    setState(() {
      data = DateTime(2024, 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = data == null
        ? 'No Date'
        : "${data!.day}/${data!.month}/${data!.year}";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(onPressed: pickData, child: Text("Pick Date")),
            ElevatedButton(
              onPressed: setDateValue,
              child: Text("Set to 1/1/2024"),
            ),
          ],
        ),
      ),
    );
  }
}
