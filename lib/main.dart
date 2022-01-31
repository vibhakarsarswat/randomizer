import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomizer/randomizer_change_notifier.dart';
import 'package:randomizer/range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

final randomizerProvider = ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RangeSelectorPage(),
      ),
    );
  }
}
