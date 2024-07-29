import 'package:flutter/material.dart';

class LabeledWidget extends StatelessWidget {
  final String labelText;
  final Widget child;
  const LabeledWidget({
    required this.labelText,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        child,
      ],
    );
  }
}
