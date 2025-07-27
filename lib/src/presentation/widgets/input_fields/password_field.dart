import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/ui/assets_constants.dart';

class PasswordField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool enabled;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;

  const PasswordField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.initialValue,
    this.contentPadding,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isObscured = true;

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

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
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
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: widget.textInputAction,
          enabled: widget.enabled,
          obscureText: _isObscured,
          onChanged: widget.onChanged,
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
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                KIcons.lockClose,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  BlendMode.srcIn,
                ),
              ),
            ),
            suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: SvgPicture.asset(
                _isObscured ? KIcons.eyeSlash : KIcons.eye,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  BlendMode.srcIn,
                ),
              ),
            ),
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.dividerColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.dividerColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.dividerColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            filled: true,
            fillColor: widget.enabled
                ? (_isFocused
                      ? theme.colorScheme.surface
                      : theme.colorScheme.surface.withValues(alpha: 0.5))
                : theme.colorScheme.surface.withValues(alpha: 0.3),
          ),
        ),
      ],
    );
  }
}
