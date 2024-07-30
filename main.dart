// Theirs
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:lifter/screens/home/home_screen.dart';
import 'package:lifter/common/theme.dart';
import 'package:lifter/common/list_model.dart';
import 'package:lifter/data/meta.dart';
import 'package:lifter/common/nav_service.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MetaInfo.title,
      debugShowCheckedModeBanner: false,
      theme: generateTheme(context),
      home: const HomeScreen(),
      navigatorKey: NavService.key,
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ListModel(),
      child: const App(),
    ),
  );
}
