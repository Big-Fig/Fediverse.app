import 'dart:ui';

import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

const darkFediUiTheme = DarkFediUiTheme();
const _darkFediUiColorTheme = DarkFediUiColorTheme();
const _darkFediUiTextTheme = FediUiTextTheme(colorTheme: _darkFediUiColorTheme);

class DarkFediUiTheme implements IFediUiTheme {
  @override
  String get id => "dark";
  @override
  final IFediUiColorTheme colorTheme = _darkFediUiColorTheme;

  @override
  IFediUiTextTheme get textTheme => _darkFediUiTextTheme;

  const DarkFediUiTheme();

  @override
  ThemeData get themeData =>
      createBaseFediThemeData(_darkFediUiColorTheme.primary).copyWith(
        brightness: Brightness.dark,
      );
}

class DarkFediUiColorTheme implements IFediUiColorTheme {
  const DarkFediUiColorTheme();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get primary => const Color(0xff00BCEC);

  @override
  Color get primaryDark => const Color(0xff009DC5);

  @override
  Color get secondary => const Color(0xffEA4B98);

  @override
  Color get darkGrey => const Color(0xffC8C8C8);

  // Color get darkGrey => const Color(0xff2B2B2B);

  @override
  // Color get mediumGrey => const Color(0xff5F5F5F);
  Color get mediumGrey => const Color(0xff969696);

  @override
  // Color get grey => const Color(0xff969696);
  Color get grey => const Color(0xff5F5F5F);

  @override
  // Color get lightGrey => const Color(0xffC8C8C8);
  Color get lightGrey => const Color(0xff2B2B2B);

  @override
  // Color get ultraLightGrey => const Color(0xffEAEAEA);
  Color get ultraLightGrey => const Color(0xff333333);

  @override
  Color get offWhite => const Color(0xffFAFAFA);

  @override
  Color get error => const Color(0xffD52600);

  @override
  // Color get white => const Color(0xffFFFFFF);
  Color get white => const Color(0xff000000);

  // Color get black => const Color(0xff000000);
  @override
  Color get black => const Color(0xffFFFFFF);

  @override
  // Color get imageDarkOverlay => const Color(0x33333333);
  Color get imageDarkOverlay => const Color(0x33EAEAEA);
}
