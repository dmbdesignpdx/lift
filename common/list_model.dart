// Theirs
import 'package:flutter/material.dart';

final class ListModel extends ChangeNotifier {
  final _list = {
    'Back Squat': [0],
    'Front Squat': [0],
    'Bench Press': [0],
    'Overhead Press': [0],
    'Snatch': [0],
    'Clean and Jerk': [0],
  };

  Map<String, List<int>> get list => _list;

  void add(String name) {
    _list.putIfAbsent(name, () => [0]);
    notifyListeners();
  }

  void remove(String name) {
    _list.remove(name);
    notifyListeners();
  }

  void update(String name, int value) {
    _list.update(name, (list) => list..add(value));
    notifyListeners();
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }
}
