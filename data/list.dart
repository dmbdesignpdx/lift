import 'package:flutter/material.dart';

class GroupSetting {
  final String title;
  final List<String> settings;
  final Icon icon;
  final Color color;
  final String copy;

  const GroupSetting({
    required this.title,
    required this.settings,
    required this.icon,
    required this.color,
    this.copy = '',
  });
}

const connections = GroupSetting(
  title: 'Connections',
  settings: [
    'Wi-Fi',
    'Bluetooth',
    'Airplane Mode',
  ],
  icon: Icon(Icons.wifi),
  color: Color(0xFF448AFF),
  copy: 'Maybe some little blurb about Connections.',
);

const sounds = GroupSetting(
  title: 'Sounds and Vibration',
  settings: ['Sound Mode', 'Volume', 'Ringtone'],
  icon: Icon(Icons.volume_up_rounded),
  color: Color(0xFF7C4DFF),
  copy: 'Maybe some little blurb about Sounds and Vibration.',
);

const notifications = GroupSetting(
  title: 'Notifications',
  settings: ['Status Bar', 'Do Not Disturb'],
  icon: Icon(Icons.mark_email_unread_rounded),
  color: Color(0xFFFF8A65),
  copy: 'Maybe some little blurb about Notifications.',
);

const display = GroupSetting(
  title: 'Display',
  settings: ['Brightness', 'Eye Comfort', 'Screen Timeout'],
  icon: Icon(Icons.wb_sunny_rounded),
  color: Color(0xFF8BC34A),
  copy: 'Maybe some little blurb about Display.',
);

const wallpaper = GroupSetting(
  title: 'Wallpaper and Style',
  settings: ['Wallpapers', 'Color Palette'],
  icon: Icon(Icons.image_rounded),
  color: Color(0xFFEF5350),
  copy: 'Maybe some little blurb about Wallpaper and Style.',
);

const themes = GroupSetting(
  title: 'Themes',
  settings: ['Themes', 'Wallpapers', 'Icons'],
  icon: Icon(Icons.format_paint_rounded),
  color: Color(0xFFAA00FF),
  copy: 'Maybe some little blurb about Themes.',
);

const homeScreen = GroupSetting(
  title: 'Home Screen',
  settings: ['Layout', 'App Icon Badges'],
  icon: Icon(Icons.home_rounded),
  color: Color(0xFF00BCD4),
  copy: 'Maybe some little blurb about Home Screen.',
);

const lockScreen = GroupSetting(
  title: 'Lock Screen',
  settings: ['Layout', 'App Icon Badges'],
  icon: Icon(Icons.lock_rounded),
  color: Color(0xFF009688),
  copy: 'Maybe some little blurb about Lock Screen.',
);

const biometricsSecurity = GroupSetting(
  title: 'Biometrics Security',
  settings: ['Layout', 'App Icon Badges'],
  icon: Icon(Icons.security_rounded),
  color: Color(0xFF651FFF),
  copy: 'Maybe some little blurb about Biometrics Security.',
);

const privacy = GroupSetting(
  title: 'Privacy',
  settings: ['Permission Usage', 'App Icon Badges'],
  icon: Icon(Icons.person_2_rounded),
  color: Color(0xFF039BE5),
  copy: 'Maybe some little blurb about Privacy.',
);

const location = GroupSetting(
  title: 'Location',
  settings: ['Location Requests'],
  icon: Icon(Icons.location_pin),
  color: Color(0xFF43A047),
  copy: 'Maybe some little blurb about Location.',
);

final settingsRef = {
  connections.title: connections,
  sounds.title: sounds,
  notifications.title: notifications,
  display.title: display,
  wallpaper.title: wallpaper,
  themes.title: themes,
  homeScreen.title: homeScreen,
  lockScreen.title: lockScreen,
  biometricsSecurity.title: biometricsSecurity,
  privacy.title: privacy,
  location.title: location,
};

final mainSettings = [
  connections,
  sounds,
  notifications,
  display,
  wallpaper,
  themes,
  homeScreen,
  lockScreen,
  biometricsSecurity,
  privacy,
  location,
];
