import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int min = 0, max = 0;
  int? _generatedNumber;
  int? get generatedNumber => _generatedNumber;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
    // Below method call will trigger a widget rebuild which are wrapped inside a 'Consumer Widget'
    notifyListeners();
  }
}
