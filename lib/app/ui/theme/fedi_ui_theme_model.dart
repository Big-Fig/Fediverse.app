import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore_for_file: no-magic-number
ThemeData createBaseFediThemeData(Color primaryColor) => ThemeData(
      fontFamily: 'Rubik',
      primarySwatch: MaterialColor(primaryColor.value, {
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor.withOpacity(0.6),
        600: primaryColor.withOpacity(0.7),
        700: primaryColor.withOpacity(0.8),
        800: primaryColor.withOpacity(0.9),
        900: primaryColor.withOpacity(1.0),
      }),
    );

abstract class IFediUiTheme extends IUiTheme {
  @override
  IFediUiColorTheme get colorTheme;

  @override
  IFediUiTextTheme get textTheme;

  ThemeData adoptThemeData(ThemeData themeData);
}

class FediUiThemeOverride implements IFediUiTheme {
  @override
  final String id;

  @override
  final ThemeData themeData;
  @override
  final IFediUiColorTheme colorTheme;
  @override
  final IFediUiTextTheme textTheme;
  final IFediUiTheme originalFediUiTheme;

  FediUiThemeOverride({
    required this.colorTheme,
    required this.textTheme,
    required this.themeData,
    required this.id,
    required this.originalFediUiTheme,
  });

  @override
  ThemeData adoptThemeData(ThemeData themeData) =>
      originalFediUiTheme.adoptThemeData(themeData);
}

abstract class IFediUiColorTheme implements IUiColorTheme {
  static IFediUiColorTheme of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediUiColorTheme>(context, listen: listen);
}

class FediUiColorThemeOverride implements IFediUiColorTheme {
  final IFediUiColorTheme baseTheme;
  final Color? primaryOverride;
  final Color? primaryDarkOverride;

  FediUiColorThemeOverride({
    required this.baseTheme,
    required this.primaryOverride,
    required this.primaryDarkOverride,
  });

  @override
  Color get black => baseTheme.black;

  @override
  Brightness get brightness => baseTheme.brightness;

  @override
  Color get darkGrey => baseTheme.darkGrey;

  @override
  Color get error => baseTheme.error;

  @override
  Color get grey => baseTheme.grey;

  @override
  Color get imageDarkOverlay => baseTheme.imageDarkOverlay;

  @override
  Color get lightGrey => baseTheme.lightGrey;

  @override
  Color get mediumGrey => baseTheme.mediumGrey;

  @override
  Color get modalBottomSheetDarkOverlay =>
      baseTheme.modalBottomSheetDarkOverlay;

  @override
  Color get offWhite => baseTheme.offWhite;

  @override
  Color get primary => primaryOverride ?? baseTheme.primary;

  @override
  Color get primaryDark => primaryDarkOverride ?? baseTheme.primaryDark;

  @override
  Color get secondary => baseTheme.secondary;

  @override
  Color get transparent => baseTheme.transparent;

  @override
  Color get ultraLightGrey => baseTheme.ultraLightGrey;

  @override
  Color get white => baseTheme.white;
}

abstract class IFediUiTextTheme implements IUiTextTheme {
  static IFediUiTextTheme of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediUiTextTheme>(context, listen: listen);

  TextStyle get smallShortWhite;

  TextStyle get mediumShortWhite;

  TextStyle get bigShortWhite;

  TextStyle get subHeaderShortWhite;

  TextStyle get smallWhite;

  TextStyle get mediumWhite;

  TextStyle get bigWhite;

  TextStyle get subHeaderWhite;

  TextStyle get smallTallWhite;

  TextStyle get mediumTallWhite;

  TextStyle get bigTallWhite;

  TextStyle get subHeaderTallWhite;

  TextStyle get smallShortBoldWhite;

  TextStyle get mediumShortBoldWhite;

  TextStyle get bigShortBoldWhite;

  TextStyle get subHeaderShortBoldWhite;

  TextStyle get smallBoldWhite;

  TextStyle get mediumBoldWhite;

  TextStyle get bigBoldWhite;

  TextStyle get subHeaderBoldWhite;

  TextStyle get smallTallBoldWhite;

  TextStyle get mediumTallBoldWhite;

  TextStyle get bigTallBoldWhite;

  TextStyle get subHeaderTallBoldWhite;

  TextStyle get smallShortGrey;

  TextStyle get mediumShortGrey;

  TextStyle get bigShortGrey;

  TextStyle get subHeaderShortGrey;

  TextStyle get smallGrey;

  TextStyle get mediumGrey;

  TextStyle get bigGrey;

  TextStyle get subHeaderGrey;

  TextStyle get smallTallGrey;

  TextStyle get mediumTallGrey;

  TextStyle get bigTallGrey;

  TextStyle get subHeaderTallGrey;

  TextStyle get smallShortBoldGrey;

  TextStyle get mediumShortBoldGrey;

  TextStyle get bigShortBoldGrey;

  TextStyle get subHeaderShortBoldGrey;

  TextStyle get smallBoldGrey;

  TextStyle get mediumBoldGrey;

  TextStyle get bigBoldGrey;

  TextStyle get subHeaderBoldGrey;

  TextStyle get smallTallBoldGrey;

  TextStyle get mediumTallBoldGrey;

  TextStyle get bigTallBoldGrey;

  TextStyle get subHeaderTallBoldGrey;

  TextStyle get smallShortDarkGrey;

  TextStyle get mediumShortDarkGrey;

  TextStyle get bigShortDarkGrey;

  TextStyle get subHeaderShortDarkGrey;

  TextStyle get smallDarkGrey;

  TextStyle get mediumDarkGrey;

  TextStyle get bigDarkGrey;

  TextStyle get subHeaderDarkGrey;

  TextStyle get smallTallDarkGrey;

  TextStyle get mediumTallDarkGrey;

  TextStyle get bigTallDarkGrey;

  TextStyle get subHeaderTallDarkGrey;

  TextStyle get smallShortBoldDarkGrey;

  TextStyle get mediumShortBoldDarkGrey;

  TextStyle get bigShortBoldDarkGrey;

  TextStyle get subHeaderShortBoldDarkGrey;

  TextStyle get smallBoldDarkGrey;

  TextStyle get mediumBoldDarkGrey;

  TextStyle get bigBoldDarkGrey;

  TextStyle get subHeaderBoldDarkGrey;

  TextStyle get smallTallBoldDarkGrey;

  TextStyle get mediumTallBoldDarkGrey;

  TextStyle get bigTallBoldDarkGrey;

  TextStyle get subHeaderTallBoldDarkGrey;

  TextStyle get smallShortPrimary;

  TextStyle get mediumShortPrimary;

  TextStyle get bigShortPrimary;

  TextStyle get subHeaderShortPrimary;

  TextStyle get smallPrimary;

  TextStyle get mediumPrimary;

  TextStyle get bigPrimary;

  TextStyle get subHeaderPrimary;

  TextStyle get smallTallPrimary;

  TextStyle get mediumTallPrimary;

  TextStyle get bigTallPrimary;

  TextStyle get subHeaderTallPrimary;

  TextStyle get smallShortBoldPrimary;

  TextStyle get mediumShortBoldPrimary;

  TextStyle get bigShortBoldPrimary;

  TextStyle get subHeaderShortBoldPrimary;

  TextStyle get smallBoldPrimary;

  TextStyle get mediumBoldPrimary;

  TextStyle get bigBoldPrimary;

  TextStyle get subHeaderBoldPrimary;

  TextStyle get smallTallBoldPrimary;

  TextStyle get mediumTallBoldPrimary;

  TextStyle get bigTallBoldPrimary;

  TextStyle get subHeaderTallBoldPrimary;

  TextStyle get smallShortPrimaryDark;

  TextStyle get mediumShortPrimaryDark;

  TextStyle get bigShortPrimaryDark;

  TextStyle get subHeaderShortPrimaryDark;

  TextStyle get smallPrimaryDark;

  TextStyle get mediumPrimaryDark;

  TextStyle get bigPrimaryDark;

  TextStyle get subHeaderPrimaryDark;

  TextStyle get smallTallPrimaryDark;

  TextStyle get mediumTallPrimaryDark;

  TextStyle get bigTallPrimaryDark;

  TextStyle get subHeaderTallPrimaryDark;

  TextStyle get smallShortBoldPrimaryDark;

  TextStyle get mediumShortBoldPrimaryDark;

  TextStyle get bigShortBoldPrimaryDark;

  TextStyle get subHeaderShortBoldPrimaryDark;

  TextStyle get smallBoldPrimaryDark;

  TextStyle get mediumBoldPrimaryDark;

  TextStyle get bigBoldPrimaryDark;

  TextStyle get subHeaderBoldPrimaryDark;

  TextStyle get smallTallBoldPrimaryDark;

  TextStyle get mediumTallBoldPrimaryDark;

  TextStyle get bigTallBoldPrimaryDark;

  TextStyle get subHeaderTallBoldPrimaryDark;

  TextStyle get smallShortError;

  TextStyle get mediumShortError;

  TextStyle get bigShortError;

  TextStyle get subHeaderShortError;

  TextStyle get smallError;

  TextStyle get mediumError;

  TextStyle get bigError;

  TextStyle get subHeaderError;

  TextStyle get smallTallError;

  TextStyle get mediumTallError;

  TextStyle get bigTallError;

  TextStyle get subHeaderTallError;

  TextStyle get smallShortBoldError;

  TextStyle get mediumShortBoldError;

  TextStyle get bigShortBoldError;

  TextStyle get subHeaderShortBoldError;

  TextStyle get smallBoldError;

  TextStyle get mediumBoldError;

  TextStyle get bigBoldError;

  TextStyle get subHeaderBoldError;

  TextStyle get smallTallBoldError;

  TextStyle get mediumTallBoldError;

  TextStyle get bigTallBoldError;

  TextStyle get subHeaderTallBoldError;

  TextStyle get smallShortLightGrey;

  TextStyle get mediumShortLightGrey;

  TextStyle get bigShortLightGrey;

  TextStyle get subHeaderShortLightGrey;

  TextStyle get smallLightGrey;

  TextStyle get mediumLightGrey;

  TextStyle get bigLightGrey;

  TextStyle get subHeaderLightGrey;

  TextStyle get smallTallLightGrey;

  TextStyle get mediumTallLightGrey;

  TextStyle get bigTallLightGrey;

  TextStyle get subHeaderTallLightGrey;

  TextStyle get smallShortBoldLightGrey;

  TextStyle get mediumShortBoldLightGrey;

  TextStyle get bigShortBoldLightGrey;

  TextStyle get subHeaderShortBoldLightGrey;

  TextStyle get smallBoldLightGrey;

  TextStyle get mediumBoldLightGrey;

  TextStyle get bigBoldLightGrey;

  TextStyle get subHeaderBoldLightGrey;

  TextStyle get smallTallBoldLightGrey;

  TextStyle get mediumTallBoldLightGrey;

  TextStyle get bigTallBoldLightGrey;

  TextStyle get subHeaderTallBoldLightGrey;

  TextStyle get smallShortMediumGrey;

  TextStyle get mediumShortMediumGrey;

  TextStyle get bigShortMediumGrey;

  TextStyle get subHeaderShortMediumGrey;

  TextStyle get smallMediumGrey;

  TextStyle get mediumMediumGrey;

  TextStyle get bigMediumGrey;

  TextStyle get subHeaderMediumGrey;

  TextStyle get smallTallMediumGrey;

  TextStyle get mediumTallMediumGrey;

  TextStyle get bigTallMediumGrey;

  TextStyle get subHeaderTallMediumGrey;

  TextStyle get smallShortBoldMediumGrey;

  TextStyle get mediumShortBoldMediumGrey;

  TextStyle get bigShortBoldMediumGrey;

  TextStyle get subHeaderShortBoldMediumGrey;

  TextStyle get smallBoldMediumGrey;

  TextStyle get mediumBoldMediumGrey;

  TextStyle get bigBoldMediumGrey;

  TextStyle get subHeaderBoldMediumGrey;

  TextStyle get smallTallBoldMediumGrey;

  TextStyle get mediumTallBoldMediumGrey;

  TextStyle get bigTallBoldMediumGrey;

  TextStyle get subHeaderTallBoldMediumGrey;

  TextStyle get headerDarkGrey;

  TextStyle get headerBoldWhite;

  TextStyle get dialogTitleBoldDarkGrey;

  TextStyle get dialogContentDarkGrey;

  TextStyle get giantTitleShortBoldDarkGrey;
}

class FediUiTextTheme implements IFediUiTextTheme {
  final IFediUiColorTheme colorTheme;

  static const _smallSize = 12.0;
  static const _mediumSize = 14.0;
  static const _bigSize = 16.0;
  static const _subHeaderSize = 18.0;
  static const _headerSize = 24.0;
  static const _shortHeight = 1.15;
  static const _defaultHeight = 1.0;
  static const _tallHeight = 1.5;
  static const _boldWeight = FontWeight.w500;
  static const _normalWeight = FontWeight.normal;

  Color get _whiteColor => colorTheme.white;

  Color get _darkGreyColor => colorTheme.darkGrey;

  Color get _greyColor => colorTheme.grey;

  Color get _lightGreyColor => colorTheme.lightGrey;

  Color get _mediumGreyColor => colorTheme.mediumGrey;

  Color get _primaryColor => colorTheme.primary;

  Color get _primaryDarkColor => colorTheme.primaryDark;

  Color get _errorColor => colorTheme.error;

  const FediUiTextTheme({
    required this.colorTheme,
  });

  @override
  TextStyle get smallShortWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldWhite => TextStyle(
        color: _whiteColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldGrey => TextStyle(
        color: _greyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldDarkGrey => TextStyle(
        color: _darkGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldPrimary => TextStyle(
        color: _primaryColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldPrimaryDark => TextStyle(
        color: _primaryDarkColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldError => TextStyle(
        color: _errorColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldError => TextStyle(
        color: _errorColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldError => TextStyle(
        color: _errorColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldError => TextStyle(
        color: _errorColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldLightGrey => TextStyle(
        color: _lightGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallShortMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumShortMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigShortMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderShortMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallTallMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get mediumTallMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get bigTallMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get subHeaderTallMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _normalWeight,
      );

  @override
  TextStyle get smallShortBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumShortBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigShortBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderShortBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _shortHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _defaultHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get smallTallBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _smallSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get mediumTallBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _mediumSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get bigTallBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _bigSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get subHeaderTallBoldMediumGrey => TextStyle(
        color: _mediumGreyColor,
        fontSize: _subHeaderSize,
        height: _tallHeight,
        fontWeight: _boldWeight,
      );

  @override
  TextStyle get headerDarkGrey => TextStyle(
        fontSize: _headerSize,
        fontWeight: _normalWeight,
        color: _darkGreyColor,
      );

  @override
  TextStyle get headerBoldWhite => TextStyle(
        fontSize: _headerSize,
        fontWeight: _boldWeight,
        color: _whiteColor,
      );

  @override
  TextStyle get dialogTitleBoldDarkGrey => TextStyle(
        fontSize: 18.0,
        fontWeight: _boldWeight,
        color: _darkGreyColor,
      );

  @override
  TextStyle get dialogContentDarkGrey => TextStyle(
        fontSize: 16.0,
        fontWeight: _normalWeight,
        color: _darkGreyColor,
      );

  @override
  TextStyle get giantTitleShortBoldDarkGrey => TextStyle(
        fontSize: 20.0,
        height: _shortHeight,
        fontWeight: _boldWeight,
        color: _darkGreyColor,
      );
}
