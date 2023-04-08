import 'package:flutter/material.dart';

class AWTextField extends StatefulWidget {
  const AWTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.readOnly = false,
    this.icon,
    this.label,
    this.error,
    this.hintText,
    this.helperText,
    this.suffixText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final IconData? icon;
  final String? label;
  final bool Function(BuildContext)? error;
  final String? hintText;
  final String? helperText;
  final String? suffixText;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  @override
  State<AWTextField> createState() => _AWTextFieldState();
}

class _AWTextFieldState extends State<AWTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocus);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocus);
    super.dispose();
  }

  void _onFocus() {
    if (!widget.focusNode.hasFocus) return;

    widget.controller.selection = TextSelection.collapsed(
      offset: widget.controller.text.characters.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) => TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          labelText: widget.label,
          hintText: widget.hintText,
          errorText: widget.error?.call(context) ?? false
              ? widget.helperText ?? ''
              : null,
          helperText: widget.helperText,
          suffixText: widget.suffixText,
        ),
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
      ),
    );
  }
}
