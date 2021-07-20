import 'dart:async';
import 'dart:convert' as c;

import 'package:fedi/main.dart' as main_app;
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

Future main() async {
  DataHandler handler;
  handler = (String? message) async {
    // var locale = Locale(ui.window.locale.languageCode);
    // final localizations =
    //     await ExampleLocalizations.load(locale);
    final response = {
      // 'counterIncrementButtonTooltip':
      //     localizations.counterIncrementButtonTooltip,
      // 'counterText': localizations.counterText,
      // 'title': localizations.title,
      // 'locale': Intl.defaultLocale,
      'counterIncrementButtonTooltip': 'counterIncrementButtonTooltip',
    };

    return Future.value(
      c.jsonEncode(
        response,
      ),
    );
  };

  enableFlutterDriverExtension(handler: handler);
  WidgetsApp.debugAllowBannerOverride = false; // remove debug banner
  await main_app.main();
}
