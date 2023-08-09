import 'package:flutter/material.dart';
import 'package:riching_text/riching_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(title: const Text('RichingText')),
        body: RichingText(
          highlights: [
            const ActionableText(
              text: 'RichingText example',
              style: TextStyle(color: Colors.pink),
            ),
            ActionableText(
              text: 'here',
              style: const TextStyle(
                color: Colors.green,
                decoration: TextDecoration.lineThrough,
              ),
              action: () {
                // Execute action
              },
            ),
          ],
          text: 'RichingText example available here',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
