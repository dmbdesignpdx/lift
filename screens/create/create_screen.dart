// Theirs
import 'package:flutter/material.dart';

// Ours
import 'package:lifter/hooks/context.dart';
import 'package:lifter/data/create_screen.dart';
import 'package:lifter/data/ui.dart';
import 'package:lifter/models/input_field.dart';
import 'package:lifter/common/theme.dart';
import 'package:lifter/components/app_button.dart';
import 'package:lifter/components/wrapper.dart';

final class CreateScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  CreateScreen({super.key});

  void submissionAction(String value, BuildContext ctx) {
    final list = useProvider(ctx);

    list.add(value);

    controller.clear();
    FocusScope.of(ctx).requestFocus(FocusNode());

    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(
        '"$value" created!',
        style: const TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(CreateSection.title),
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: Space.level_5), // MARGIN

            const Wrapper(child: Text(CreateSection.heading)),

            const SizedBox(height: Space.level_2), // MARGIN

            Wrapper(
              child: InputField(
                label: ToolTip.add,
                controller: controller,
                onSubmitted: (value) => submissionAction(value, context),
              ),
            ),

            const SizedBox(height: Space.level_2), // MARGIN

            AppButton(
              label: Label.submit,
              onPressed: () => submissionAction(controller.text, context),
            ),

            const SizedBox(height: Space.level_2), // MARGIN
          ],
        ),
      ),
    );
  }
}
