import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AWTextField extends StatefulWidget {
  const AWTextField({
    super.key,
    this.doubleOnly = false,
    required this.controller,
    required this.focusNode,
    this.readOnly = false,
    this.icon,
    this.label,
    this.additionalValue,
    this.error,
    this.hintText,
    this.helperText,
    this.suffixText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.inputFormatters = const [],
  });

  // fixme: this is quick fix.
  final bool doubleOnly;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool readOnly;
  final IconData? icon;
  final String? label;
  final String? additionalValue;
  final bool? error;
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
    final additionalValue = widget.additionalValue;
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
              errorText: widget.error ?? false ? '' : null,
              suffixText: widget.suffixText,
            ),
            style: TextStyle(
              color: widget.readOnly ? Theme.of(context).hintColor : null,
            ),
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            inputFormatters: [
              ...widget.inputFormatters,
              if (widget.doubleOnly) ...[
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
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 67),
            child: Text(
              helperText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        if (additionalValue != null)
          Positioned(
            right: 12,
            top: 39,
            child: Text(
              additionalValue,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
