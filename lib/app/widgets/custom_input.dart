import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final bool isPassword;
  final void Function(String)? onChanged;
  final int maxLines;

  const CustomInput({
    super.key,
    required this.label,
    this.isPassword = false,
    this.onChanged,
    this.maxLines = 1,   // ← ← أضفنا هالباراميتر
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: isPassword,
      maxLines: maxLines, // ← ← استخدمناه هون
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
