import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.inputFormatters = const [],
  });

  final TextEditingController? controller;
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
  final List<TextInputFormatter> inputFormatters;

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

    final controller = widget.controller;
    controller?.selection = TextSelection.collapsed(
      offset: controller.text.characters.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final helperText = widget.helperText;

    return Stack(
      fit: StackFit.passthrough,
      children: [
        AnimatedBuilder(
          animation: widget.controller ?? ValueNotifier(null),
          builder: (context, _) => TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
              labelText: widget.label,
              hintText: widget.hintText,
              errorText: widget.error?.call(context) ?? false ? '' : null,
              suffixText: widget.suffixText,
            ),
            style: TextStyle(
              color: widget.readOnly ? Theme.of(context).hintColor : null,
            ),
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            inputFormatters: [
              ...widget.inputFormatters,
              if (widget.keyboardType.index == TextInputType.number.index) ...[
                TextInputFormatter.withFunction(
                  (oldValue, newValue) => newValue.copyWith(
                    text: newValue.text.replaceAll(',', '.'),
                  ),
                ),
                FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
              ],
            ],
          ),
        ),
        if (helperText != null && !false)
          Padding(
            padding: const EdgeInsets.only(top: 67),
            child: Text(
              helperText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
