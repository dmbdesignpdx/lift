import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(46.0, 46.0)),
      child: Text(label),
    );
  }
}
