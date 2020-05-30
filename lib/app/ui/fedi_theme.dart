import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';

Map<int, Color> _primaryColorSwatch = {
  50: FediColors.primaryColor.withOpacity(0.1),
  100: FediColors.primaryColor.withOpacity(0.2),
  200: FediColors.primaryColor.withOpacity(0.3),
  300: FediColors.primaryColor.withOpacity(0.4),
  400: FediColors.primaryColor.withOpacity(0.5),
  500: FediColors.primaryColor.withOpacity(0.6),
  600: FediColors.primaryColor.withOpacity(0.7),
  700: FediColors.primaryColor.withOpacity(0.8),
  800: FediColors.primaryColor.withOpacity(0.9),
  900: FediColors.primaryColor.withOpacity(1.0),
};

final ThemeData fediTheme = ThemeData(
    fontFamily: "Rubik",
    primarySwatch: MaterialColor(0xff00BCEC, _primaryColorSwatch),
    primaryColor: FediColors.primaryColor,
    primaryColorDark: FediColors.primaryColorDark,
//    appBarTheme: AppBarTheme(brightness: Brightness.light)
//    brightness: Brightness.dark
//  accentColor: FediColors.secondaryColor,
    );
