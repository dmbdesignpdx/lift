// Theirs
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:fl_chart/fl_chart.dart';

// Ours
import '../../hooks/context.dart';
import '../../data/ui.dart';
import '../../data/detail_screen.dart';
import '../../common/navigation.dart';
import '../../common/theme.dart';
import '../../models/input_field.dart';

final class DetailScreen extends StatelessWidget {
  final String name;
  final TextEditingController controller = TextEditingController();

  DetailScreen({
    super.key,
    required this.name,
  });

  void submissionAction(String value, BuildContext ctx) {
    final list = useProvider(ctx);

    final int? num = int.tryParse(value);

    if (num != null) {
      list.update(name, num);
    }

    controller.clear();
    FocusScope.of(ctx).requestFocus(FocusNode());
  }

  void removeAction(BuildContext ctx) {
    final list = useProvider(ctx);

    list.remove(name);

    NavigateTo.homeScreen();
  }

  void showWarningDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          content: Text('Are you sure you want to delete "$name"?'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => removeAction(context),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        title: Text(name),
        actions: <Widget>[
          IconButton(
            onPressed: () => showWarningDialog(context),
            icon: const Icon(Icons.delete),
            tooltip: ToolTip.remove,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.level_1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //
              //~ Main Display Text
              Consumer<ListModel>(
                builder: (context, value, child) {
                  final x = value.list[name];

                  if (x == null) {
                    return Container();
                  }

                  final maxOfAll = x.length > 1 ? x.reduce((a, b) => a > b ? a : b) : 0;

                  return RichText(
                    text: TextSpan(
                      style: text.headlineSmall,
                      children: <TextSpan>[
                        const TextSpan(text: '${DetailScreenCopy.heading} '),
                        TextSpan(
                          text: '$maxOfAll',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: color.primary,
                          ),
                        ),
                        const TextSpan(text: ' !'),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: Space.level_0), // MARGIN

              //~ Sub Display Text
              const Text(
                '(in pounds)',
                style: TextStyle(color: Color(0xFF9E9E9E)),
              ),

              const SizedBox(height: Space.level_2), // MARGIN

              //~ Input Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Space.level_5),
                child: InputField(
                  label: Label.liftAmount,
                  controller: controller,
                  onSubmitted: (value) => submissionAction(value, context),
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(height: Space.level_2), // MARGIN

              //~ Submit Button
              ElevatedButton(
                onPressed: () => submissionAction(controller.text, context),
                style: ElevatedButton.styleFrom(minimumSize: const Size(46.0, 46.0)),
                child: const Text(Label.submit),
              ),

              const SizedBox(height: Space.level_4), // MARGIN

              //~ History Graph
              Consumer<ListModel>(
                builder: (context, value, widget) {
                  final x = value.list[name];

                  if (x == null) {
                    return Container();
                  }

                  return Text('${DetailScreenCopy.history} ${x.toString()}');
                }, // builder
              ),
            ],
          ),
        ),
      ),
    );
  }
}
