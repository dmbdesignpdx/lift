// Theirs
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:lifter/common/list_model.dart';

// Forward
export 'package:lifter/common/list_model.dart' show ListModel;

(TextTheme, ColorScheme) useThemeContext(BuildContext context) {
  return (Theme.of(context).textTheme, Theme.of(context).colorScheme);
}

ListModel useProvider(BuildContext context) {
  return Provider.of<ListModel>(context, listen: false);
}
