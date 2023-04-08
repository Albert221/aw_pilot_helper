import 'package:flutter/material.dart';

class AWTextField extends StatelessWidget {
  const AWTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.icon,
    this.label,
    this.hintText,
    this.helperText,
    this.suffixText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final IconData? icon;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? suffixText;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        suffixText: suffixText,
      ),
      keyboardType: keyboardType,
      textAlign: textAlign,
    );
  }
}
