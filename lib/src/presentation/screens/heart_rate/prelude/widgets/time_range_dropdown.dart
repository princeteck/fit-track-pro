import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../data/models/heart_rate_model.dart';

class TimeRangeDropdown extends StatefulWidget {
  final CustomDateTimeRange selectedRange;
  final Function(CustomDateTimeRange) onRangeChanged;

  const TimeRangeDropdown({
    super.key,
    required this.selectedRange,
    required this.onRangeChanged,
  });

  @override
  State<TimeRangeDropdown> createState() => _TimeRangeDropdownState();
}

class _TimeRangeDropdownState extends State<TimeRangeDropdown> {
  final List<CustomDateTimeRange> _timeRanges = [
    CustomDateTimeRange.day(),
    CustomDateTimeRange.week(),
    CustomDateTimeRange.month(),
    CustomDateTimeRange.threeMonths(),
    CustomDateTimeRange.sixMonths(),
    CustomDateTimeRange.year(),
  ];

  final Map<String, String> _rangeLabels = {
    'day': '1 Day',
    'week': '1 Week',
    'month': '1 Month',
    'threeMonths': '3 Months',
    'sixMonths': '6 Months',
    'year': '12 Months',
  };

  // Calculate approximate width based on text length
  double _getWidthForText(String text) {
    // Base width for padding and icon
    const baseWidth =
        16.0 +
        16.0 +
        8.0 +
        16.0; // left padding + right padding + spacing + icon width
    // Approximate character width (this is a rough estimate)
    const charWidth = 8.5;
    return baseWidth + (text.length * charWidth);
  }

  void _showTimeRangeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildTimeRangeBottomSheet(),
    );
  }

  void _selectRange(CustomDateTimeRange range) {
    widget.onRangeChanged(range);
    Navigator.of(context).pop();
  }

  String _getRangeLabel(CustomDateTimeRange range) {
    final type = range.type;
    return _rangeLabels[type] ?? '1 Day';
  }

  Widget _buildTimeRangeBottomSheet() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? theme.colorScheme.surface : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Select Time Range',
                style: GoogleFonts.inter(
                  textStyle: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            // Options list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _timeRanges.length,
              itemBuilder: (context, index) {
                final range = _timeRanges[index];
                final isSelected = range.type == widget.selectedRange.type;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _selectRange(range),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _getRangeLabel(range),
                              style: GoogleFonts.inter(
                                textStyle: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: theme.colorScheme.primary,
                              size: 24,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final currentText = _getRangeLabel(widget.selectedRange);
    final containerWidth = _getWidthForText(currentText);

    return GestureDetector(
      onTap: _showTimeRangeBottomSheet,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: containerWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDarkMode
              ? theme.colorScheme.surfaceContainerHigh
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: isRTL
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  key: ValueKey(currentText),
                  currentText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              KIcons.arrowLineDown,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.onSurface.withValues(alpha: 0.6),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
