// Theirs
import 'package:flutter/material.dart';

// Ours
import 'package:lifter/common/theme.dart';
import 'package:lifter/hooks/context.dart';
import 'package:lifter/data/ui.dart';

final class TextInput extends StatelessWidget {
  final String label;
  final String? name;
  final TextEditingController controller = TextEditingController();

  TextInput({
    super.key,
    required this.label,
    this.name,
  });

  bool get hasName => name != null;
  double get fontSize => hasName ? 30 : 24;
  double get padding => hasName ? Space.level_4 : Space.level_2;
  TextInputType get keyboardType => hasName ? TextInputType.number : TextInputType.name;

  void submitAction(String value, BuildContext context) {
    final list = useProvider(context);

    if (hasName) {
      final int? num = int.tryParse(value);

      if (num != null) {
        list.update(name!, num);
      }
    } else {
      list.add(value);
      Navigator.pop(context);
    }

    // Clear input
    controller.clear();

    // Close keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    // SnackBar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        'Lift added!',
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        textColor: Colors.amber,
        label: 'Dismiss',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            style: TextStyle(
              fontSize: fontSize.toDouble(),
            ),
            controller: controller,
            onSubmitted: (value) => submitAction(value, context),
            textInputAction: TextInputAction.done,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(label),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Space.level_2),
            child: ElevatedButton(
              onPressed: () => submitAction(controller.text, context),
              child: const Text(Label.submit),
            ),
          ),
        ],
      ),
    );
  }
}
