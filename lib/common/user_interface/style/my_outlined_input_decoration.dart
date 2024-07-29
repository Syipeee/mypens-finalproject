import 'package:flutter/material.dart';

class MyOutlinedInputDecoration extends InputDecoration{
  MyOutlinedInputDecoration({
    super.label,
    super.errorText,
    super.suffixIcon,
    super.contentPadding
  }) : super(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    alignLabelWithHint: true,
  );
}