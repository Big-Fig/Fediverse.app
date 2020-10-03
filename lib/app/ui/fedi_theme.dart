import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';

Map<int, Color> _primaryColorSwatch = {
  50: FediColors.primary.withOpacity(0.1),
  100: FediColors.primary.withOpacity(0.2),
  200: FediColors.primary.withOpacity(0.3),
  300: FediColors.primary.withOpacity(0.4),
  400: FediColors.primary.withOpacity(0.5),
  500: FediColors.primary.withOpacity(0.6),
  600: FediColors.primary.withOpacity(0.7),
  700: FediColors.primary.withOpacity(0.8),
  800: FediColors.primary.withOpacity(0.9),
  900: FediColors.primary.withOpacity(1.0),
};

final ThemeData fediTheme = ThemeData(
    fontFamily: "Rubik",
    primarySwatch: MaterialColor(0xff00BCEC, _primaryColorSwatch),
    primaryColor: FediColors.primary,
    primaryColorDark: FediColors.primaryDark,
    );
