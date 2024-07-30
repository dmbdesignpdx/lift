// Theirs
import 'package:flutter/material.dart';

// Ours
import 'package:lifter/data/list.dart';

final class SettingsScreen extends StatelessWidget {
  final String title;
  const SettingsScreen({super.key, required this.title});

  String get _title => title;
  String get _copy => settingsRef[title]?.copy ?? 'No copy available.';
  Color get _color => settingsRef[title]?.color ?? Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        foregroundColor: Colors.white,
        backgroundColor: _color,
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            //~ Header
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 10, 20),
              child: Text(
                _copy,
                style: text.bodyLarge,
              ),
            ),
            const Divider(color: Colors.grey),
            //~ List
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const PlaceholderItem(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  } // build()
}

class PlaceholderItem extends StatelessWidget {
  const PlaceholderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final text = Theme.of(context).textTheme;
    // final color = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.grey.shade500,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 100,
      child: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Hola!'),
                  content: const Text('Lorem ipsum dolor set.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            ); // showDialog()
          },
          icon: const Icon(Icons.alarm_add_outlined),
          label: const Text('hi there'),
        ),
      ),
    );
  } // build()
}
