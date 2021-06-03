import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiTheme {
  static IUiTheme of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUiTheme>(context, listen: listen);

  String get id;

  IUiColorTheme get colorTheme;

  IUiTextTheme get textTheme;

  ThemeData get themeData;
}

abstract class IUiColorTheme {
  static IUiColorTheme of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUiColorTheme>(context, listen: listen);

  Brightness get brightness;

  Color get black;

  Color get transparent;

  Color get primary;

  Color get primaryDark;

  Color get secondary;

  Color get darkGrey;

  Color get mediumGrey;

  Color get grey;

  Color get lightGrey;

  Color get ultraLightGrey;

  Color get offWhite;

  Color get error;

  Color get white;

  Color get imageDarkOverlay;

  Color get modalBottomSheetDarkOverlay;
}

abstract class IUiTextTheme {
  static IUiTextTheme of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUiTextTheme>(context, listen: listen);
}
