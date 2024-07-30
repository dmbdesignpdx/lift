// Theirs
import 'package:flutter/material.dart';

// Ours
import 'package:lifter/data/list.dart';
import 'package:lifter/models/settings_tile.dart';

final class SandboxScreen extends StatelessWidget {
  const SandboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              collapsedHeight: 60,
              backgroundColor: color.background,
              foregroundColor: color.onBackground,
              surfaceTintColor: color.background,
              actions: <Widget>[
                //~ Search Icon
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: color.background,
                      showDragHandle: true,
                      useSafeArea: true,
                      barrierLabel: 'infoBottomSheetModal',
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Hello there.',
                                  style: text.titleMedium!.copyWith(
                                    color: color.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }, // builder()
                    ); // showModalBottomSheet()
                  }, // onPressed()
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.4,
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: color.onBackground,
                  ),
                ),
                centerTitle: true,
                // background: Container(
                //   color: color.background,
                // ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: mainSettings.length,
                (context, index) => SettingsTile(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
