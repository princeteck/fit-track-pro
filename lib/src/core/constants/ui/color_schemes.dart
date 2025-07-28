import 'package:flutter/material.dart' show ColorScheme, Brightness;
import './colors_constants.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: KColors.orange50, // Main orange brand color
  onPrimary: KColors.white, // White text on orange
  primaryContainer: KColors.orange10, // Light orange container
  onPrimaryContainer: KColors.orange100, // Dark orange text on light container
  secondary: KColors.red50, // Secondary red accent
  onSecondary: KColors.white, // White text on red
  secondaryContainer: KColors.red10, // Light red container
  onSecondaryContainer: KColors.red100, // Dark red text on light container
  tertiary: KColors.blue50, // Tertiary blue accent
  onTertiary: KColors.white, // White text on blue
  tertiaryContainer: KColors.blue10, // Light blue container
  onTertiaryContainer: KColors.blue100, // Dark blue text on light container
  error: KColors.red60, // Error red
  errorContainer: KColors.red10, // Light red error container
  onError: KColors.white, // White text on error
  onErrorContainer: KColors.red100, // Dark red text on error container
  surface: KColors.white, // White surface
  onSurface: KColors.gray100, // Dark gray text on white surface
  surfaceContainerHighest: KColors.gray10, // Light gray highest container
  onSurfaceVariant: KColors.gray70, // Medium gray text variant
  outline: KColors.gray30, // Light gray outline
  onInverseSurface: KColors.white, // White text on dark surface
  inverseSurface: KColors.gray100, // Dark surface
  inversePrimary: KColors.orange20, // Light orange on dark
  shadow: KColors.black, // Black shadow
  surfaceTint: KColors.orange50, // Orange surface tint
  outlineVariant: KColors.gray20, // Very light gray outline
  scrim: KColors.black, // Black scrim
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: KColors.orange50, // Main orange brand color
  onPrimary: KColors.white, // White text on orange
  primaryContainer: KColors.orange100, // Dark orange container
  onPrimaryContainer: KColors.orange10, // Light orange text on dark container
  secondary: KColors.red50, // Secondary red accent
  onSecondary: KColors.white, // White text on red
  secondaryContainer: KColors.red100, // Dark red container
  onSecondaryContainer: KColors.red10, // Light red text on dark container
  tertiary: KColors.blue50, // Tertiary blue accent
  onTertiary: KColors.white, // White text on blue
  tertiaryContainer: KColors.blue100, // Dark blue container
  onTertiaryContainer: KColors.blue10, // Light blue text on dark container
  error: KColors.red40, // Lighter error red for dark theme
  errorContainer: KColors.red100, // Dark red error container
  onError: KColors.white, // White text on error
  onErrorContainer: KColors.red10, // Light red text on error container
  surface: KColors.gray100, // Dark gray surface
  onSurface: KColors.white, // White text on dark surface
  surfaceContainerHighest: KColors.gray80, // Medium dark gray highest container
  onSurfaceVariant: KColors.gray30, // Light gray text variant
  outline: KColors.gray60, // Medium gray outline
  onInverseSurface: KColors.gray100, // Dark text on light surface
  inverseSurface: KColors.white, // Light surface
  inversePrimary: KColors.orange70, // Darker orange on light
  shadow: KColors.black, // Black shadow
  surfaceTint: KColors.orange50, // Orange surface tint
  outlineVariant: KColors.gray70, // Dark gray outline variant
  scrim: KColors.black, // Black scrim
);
