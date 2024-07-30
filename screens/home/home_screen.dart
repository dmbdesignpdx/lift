// Theirs
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:lifter/common/navigation.dart';
import 'package:lifter/hooks/context.dart';
import 'package:lifter/data/ui.dart';
import 'package:lifter/data/meta.dart';
import 'package:lifter/common/theme.dart';
import 'package:lifter/components/wrapper.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        title: const Text(MetaInfo.title),
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: NavigateTo.sandboxScreen,
          ),
        ],
      ),
      body: SafeArea(
        child: Wrapper(
          child: Consumer<ListModel>(
            builder: (context, value, child) => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: Space.level_1),
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                final name = value.list.keys.elementAt(index);

                return ListTile(
                  title: Text(name),
                  onTap: () => NavigateTo.detailScreen(name: name),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFFBDBDBD),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: NavigateTo.createScreen,
        tooltip: ToolTip.add,
        icon: Icon(Icons.add),
        label: Text('Lift'),
        enableFeedback: true,
      ),
    );
  } // build()
}
