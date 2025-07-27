import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.initialValue,
    this.contentPadding,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _validateField(String? value) {
    if (widget.validator != null) {
      final errorMessage = widget.validator!(value);
      setState(() {
        _hasError = errorMessage != null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: (_isFocused && !_hasError)
                  ? theme.colorScheme.primary.withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 3,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              final result = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _validateField(value);
              });
              return result;
            },
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            onTap: widget.onTap,
            onChanged: (value) {
              _validateField(value);
              widget.onChanged?.call(value);
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            initialValue: widget.initialValue,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                  width: 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: widget.enabled
                  ? (_isFocused
                        ? theme.colorScheme.surface
                        : theme.colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.3,
                          ))
                  : theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.1,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
