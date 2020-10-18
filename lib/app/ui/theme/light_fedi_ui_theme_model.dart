import 'dart:ui';

import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
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
        primaryColor: Color(0xffffc107),
        primaryColorBrightness: Brightness.light,
        primaryColorLight: Color(0xffffecb3),
        primaryColorDark: Color(0xffffa000),
        accentColor: Color(0xffffc107),
        accentColorBrightness: Brightness.light,
        canvasColor: Color(0xfffafafa),
        scaffoldBackgroundColor: Color(0xfffafafa),
        bottomAppBarColor: Color(0xffffffff),
        cardColor: Color(0xffffffff),
        dividerColor: Color(0x1f000000),
        highlightColor: Color(0x66bcbcbc),
        splashColor: Color(0x66c8c8c8),
        selectedRowColor: Color(0xfff5f5f5),
        unselectedWidgetColor: Color(0x8a000000),
        disabledColor: Color(0x61000000),
        buttonColor: Color(0xffffc107),
        toggleableActiveColor: Color(0xffffb300),
        secondaryHeaderColor: Color(0xfffff8e1),
        textSelectionColor: Color(0xffffe082),
        cursorColor: Color(0xff4285f4),
        textSelectionHandleColor: Color(0xffffd54f),
        backgroundColor: Color(0xffffe082),
        dialogBackgroundColor: Color(0xffffffff),
        indicatorColor: Color(0xffffc107),
        hintColor: Color(0x8a000000),
        errorColor: Color(0xffd32f2f),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 36,
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          alignedDropdown: false,
          buttonColor: Color(0xffffc107),
          disabledColor: Color(0x61000000),
          highlightColor: Color(0x29000000),
          splashColor: Color(0x1f000000),
          focusColor: Color(0x1f000000),
          hoverColor: Color(0x0a000000),
          colorScheme: ColorScheme(
            primary: Color(0xffffc107),
            primaryVariant: Color(0xffffa000),
            secondary: Color(0xffffc107),
            secondaryVariant: Color(0xffffa000),
            surface: Color(0xffffffff),
            background: Color(0xffffe082),
            error: Color(0xffd32f2f),
            onPrimary: Color(0xff000000),
            onSecondary: Color(0xff000000),
            onSurface: Color(0xff000000),
            onBackground: Color(0xff000000),
            onError: Color(0xffffffff),
            brightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          display4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          title: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subhead: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: TextTheme(
          display4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          title: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subhead: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        accentTextTheme: TextTheme(
          display4: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display3: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display2: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          display1: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          title: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subhead: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body2: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          body1: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            color: Color(0x8a000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            color: Color(0xff000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          hasFloatingPlaceholder: true,
          isDense: false,
          contentPadding:
              EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
          isCollapsed: false,
          prefixStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            color: Color(0xdd000000),
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
        iconTheme: IconThemeData(
          color: Color(0xdd000000),
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: IconThemeData(
          color: Color(0xff000000),
          opacity: 1,
          size: 24,
        ),
        accentIconTheme: IconThemeData(
          color: Color(0xff000000),
          opacity: 1,
          size: 24,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: null,
          inactiveTrackColor: null,
          disabledActiveTrackColor: null,
          disabledInactiveTrackColor: null,
          activeTickMarkColor: null,
          inactiveTickMarkColor: null,
          disabledActiveTickMarkColor: null,
          disabledInactiveTickMarkColor: null,
          thumbColor: null,
          disabledThumbColor: null,
          overlayColor: null,
          valueIndicatorColor: null,
          showValueIndicator: null,
          valueIndicatorTextStyle: TextStyle(
            color: Color(0xdd000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xdd000000),
          unselectedLabelColor: Color(0xb2000000),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Color(0x1f000000),
          brightness: Brightness.light,
          deleteIconColor: Color(0xde000000),
          disabledColor: Color(0x0c000000),
          labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            color: Color(0xde000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            color: Color(0x3d000000),
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: Color(0x3dffc107),
          selectedColor: Color(0x3d000000),
          shape: StadiumBorder(
              side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          )),
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: Color(0xff1e88e5),
//      textTheme: CupertinoTextThemeData(
//        textStyle: TextStyle(color: Color(0xff1e88e5))
//
//      )
        ),
      );
}

class LightFediUiColorTheme implements IFediUiColorTheme {
  const LightFediUiColorTheme();

  @override
  Brightness get brightness => Brightness.light;

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
