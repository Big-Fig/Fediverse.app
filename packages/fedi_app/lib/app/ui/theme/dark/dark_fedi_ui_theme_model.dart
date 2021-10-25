import 'dart:ui';

import 'package:fedi_app/app/ui/theme/dark/dark_fedi_ui_theme_model_id.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: no-equal-arguments
// ignore_for_file: long-method

const darkFediUiTheme = DarkFediUiTheme();
const _darkFediUiColorTheme = DarkFediUiColorTheme();
const _darkFediUiTextTheme = FediUiTextTheme(colorTheme: _darkFediUiColorTheme);

class DarkFediUiTheme implements IFediUiTheme {
  @override
  String get id => darkFediUiThemeId;
  @override
  IFediUiColorTheme get colorTheme => _darkFediUiColorTheme;

  @override
  IFediUiTextTheme get textTheme => _darkFediUiTextTheme;

  const DarkFediUiTheme();

  @override
  ThemeData get themeData {
    var themeData = createBaseFediThemeData(_darkFediUiColorTheme.primary);

    return adoptThemeData(themeData);
  }

  @override
  ThemeData adoptThemeData(ThemeData themeData) => themeData.copyWith(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff212121),
        primaryColorBrightness: Brightness.dark,
        primaryColorLight: const Color(0xff9e9e9e),
        primaryColorDark: const Color(0xff000000),
        canvasColor: const Color(0xff303030),
        scaffoldBackgroundColor: const Color(0xff303030),
        bottomAppBarColor: const Color(0xff424242),
        cardColor: const Color(0xff424242),
        dividerColor: const Color(0x1fffffff),
        highlightColor: const Color(0x40cccccc),
        splashColor: const Color(0x40cccccc),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: const Color(0xb3ffffff),
        disabledColor: const Color(0x62ffffff),
        toggleableActiveColor: const Color(0xff64ffda),
        secondaryHeaderColor: const Color(0xff616161),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xff64ffda),
          cursorColor: Color(0xff4285f4),
          selectionHandleColor: Color(0xff1de9b6),
        ),
        backgroundColor: const Color(0xff616161),
        dialogBackgroundColor: const Color(0xff424242),
        indicatorColor: const Color(0xff64ffda),
        hintColor: const Color(0x80ffffff),
        errorColor: const Color(0xffd32f2f),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 36,
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          alignedDropdown: false,
          buttonColor: Color(0xff1e88e5),
          disabledColor: Color(0x61ffffff),
          highlightColor: Color(0x29ffffff),
          splashColor: Color(0x1fffffff),
          focusColor: Color(0x1fffffff),
          hoverColor: Color(0x0affffff),
          colorScheme: ColorScheme(
            primary: Color(0xff2196f3),
            primaryVariant: Color(0xff000000),
            secondary: Color(0xff64ffda),
            secondaryVariant: Color(0xff00bfa5),
            surface: Color(0xff424242),
            background: Color(0xff616161),
            error: Color(0xffd32f2f),
            onPrimary: Color(0xffffffff),
            onSecondary: Color(0xff000000),
            onSurface: Color(0xffffffff),
            onBackground: Color(0xffffffff),
            onError: Color(0xff000000),
            brightness: Brightness.dark,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0xb3ffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          isDense: false,
          contentPadding:
              EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            color: Color(0xffffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          filled: false,
          fillColor: Color(0x00000000),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffffffff),
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xffffffff),
          opacity: 1,
          size: 24,
        ),
        sliderTheme: const SliderThemeData(
          valueIndicatorTextStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xffffffff),
          unselectedLabelColor: Color(0xb2ffffff),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0x1fffffff),
          brightness: Brightness.dark,
          deleteIconColor: Color(0xdeffffff),
          disabledColor: Color(0x0cffffff),
          labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            color: Color(0xdeffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            color: Color(0x3dffffff),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: Color(0x3d212121),
          selectedColor: Color(0x3dffffff),
          shape: StadiumBorder(
            side: BorderSide.none,
          ),
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: _darkFediUiColorTheme.primary,
//      textTheme: CupertinoTextThemeData(
//        textStyle: TextStyle(color: const Color(0xff1e88e5))
//
//      )
        ),
      );
}

class DarkFediUiColorTheme implements IFediUiColorTheme {
  const DarkFediUiColorTheme();

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get primary => const Color(0xff00BCEC);

  @override
  Color get primaryDark => const Color(0xff009DC5);

  @override
  Color get secondary => const Color(0xffEA4B98);

  @override
  // Color get mediumGrey => const Color(0xff5F5F5F);
  Color get mediumGrey => const Color(0xff969696);

  @override
  // Color get lightGrey => const Color(0xffC8C8C8);
  Color get lightGrey => const Color(0xff666666);

  @override
  // Color get darkGrey => const Color(0xff2B2B2B);
  Color get darkGrey => const Color(0xffC8C8C8);

  @override
  // Color get grey => const Color(0xff969696);
  Color get grey => const Color(0xff5F5F5F);

  @override
  // Color get ultraLightGrey => const Color(0xffEAEAEA);
  Color get ultraLightGrey => const Color(0xff323232);

  @override
  Color get offWhite => const Color(0xff101010);

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
  Color get imageDarkOverlay => const Color(0x33eaeaea);

  @override
  Color get modalBottomSheetDarkOverlay => const Color(0x66eaeaea);
}
