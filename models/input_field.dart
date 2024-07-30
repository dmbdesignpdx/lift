// Theirs
import 'package:flutter/material.dart';

// Ours

final class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final bool autocorrect;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    required this.onSubmitted,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = false,
  });

  void removeFocus(PointerDownEvent evt, BuildContext ctx) {
    FocusScope.of(ctx).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => removeFocus(event, context),
      controller: controller,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofocus: autofocus,
      enabled: enabled,
      autocorrect: autocorrect,
      style: const TextStyle(fontSize: 28),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
        suffixIcon: ClearButton(controller: controller),
      ),
    );
  }
}

class ClearButton extends StatefulWidget {
  final TextEditingController controller;

  const ClearButton({
    super.key,
    required this.controller,
  });

  @override
  State createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  var _isDisabled = true;

  void checkForEmpty() {
    setState(() {
      _isDisabled = widget.controller.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(checkForEmpty);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(checkForEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: _isDisabled ? null : () => widget.controller.clear(),
    );
  }
}
