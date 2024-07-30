// Theirs
import 'package:flutter/material.dart';

// Ours
import '../screens/home/home_screen.dart';
import '../screens/create/create_screen.dart';
import '../screens/sandbox_screen.dart';
import '../screens/detail/detail_screen.dart';
import '../screens/settings_screen.dart';
import '../common/nav_service.dart';

void pushToNav(Widget screen) {
  final context = NavService.key.currentContext!;

  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => screen),
  );
}

final class NavigateTo {
  static void homeScreen() => pushToNav(const HomeScreen());
  static void createScreen() => pushToNav(CreateScreen());
  static void sandboxScreen() => pushToNav(const SandboxScreen());
  static void detailScreen({required String name}) => pushToNav(DetailScreen(name: name));
  static void settingsScreen({required String title}) => pushToNav(SettingsScreen(title: title));
}
