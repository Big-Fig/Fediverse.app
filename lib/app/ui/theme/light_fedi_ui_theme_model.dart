import 'dart:ui';

import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

const lightFediUiTheme = LightFediUiTheme();
const _lightFediUiColorTheme = LightFediUiColorTheme();
const _lightFediUiTextTheme =
    FediUiTextTheme(colorTheme: _lightFediUiColorTheme);

class LightFediUiTheme implements IFediUiTheme {
  @override
  String get id => "light";
  @override
  final IFediUiColorTheme colorTheme = _lightFediUiColorTheme;

  @override
  IFediUiTextTheme get textTheme => _lightFediUiTextTheme;

  const LightFediUiTheme();

  @override
  ThemeData get themeData =>
      createBaseFediThemeData(_lightFediUiColorTheme.primary).copyWith(
        brightness: Brightness.light,
      );
}

class LightFediUiColorTheme implements IFediUiColorTheme {
  const LightFediUiColorTheme();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get primary => const Color(0xff00BCEC);

  @override
  Color get primaryDark => const Color(0xff009DC5);

  @override
  Color get secondary => const Color(0xffEA4B98);

  @override
  Color get lightGrey => const Color(0xffC8C8C8);

  @override
  Color get mediumGrey => const Color(0xff5F5F5F);

  @override
  Color get grey => const Color(0xff969696);

  @override
  Color get darkGrey => const Color(0xff2B2B2B);

  @override
  Color get ultraLightGrey => const Color(0xffEAEAEA);

  @override
  Color get offWhite => const Color(0xffFAFAFA);

  @override
  Color get error => const Color(0xffD52600);

  @override
  Color get white => const Color(0xffFFFFFF);

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get imageDarkOverlay => const Color(0x33333333);
}
