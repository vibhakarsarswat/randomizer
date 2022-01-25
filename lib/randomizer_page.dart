import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final int min;
  final int max;

  @override
  _RandomizerPageState createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
    );
  }
}
