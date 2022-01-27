import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/randomizer_change_notifier.dart';
import 'package:randomizer/range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Randomizer',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RangeSelectorPage(),
      ),
    );
  }
}
