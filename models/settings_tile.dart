import 'package:flutter/material.dart';

import '../data/list.dart';
import '../common/navigation.dart';

final class SettingsTile extends StatelessWidget {
  final int index;

  const SettingsTile(
    this.index, {
    super.key,
  });

  GroupSetting get item => mainSettings[index];
  double get firstMargin => index == 0 ? 10 : 0;
  // bool get hasScreen => settingScreens.containsKey(item.screen);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigateTo.settingsScreen(title: item.title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFE0E0E0),
        ),
        margin: EdgeInsets.fromLTRB(10, firstMargin, 10, 10),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //
            //~ Icon
            CircleAvatar(
              backgroundColor: item.color,
              radius: 22,
              child: item.icon,
            ),

            //~ Content Wrapper
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //
                  //~~ Title
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      letterSpacing: 0.3,
                    ),
                  ),

                  //~~ Subtitle Info
                  Text(
                    mainSettings[index].settings.join(' • '),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } // build
}
