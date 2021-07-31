import 'dart:async';
import 'dart:io';

import 'package:fedi/app/app_model.dart';
import 'package:fedi/main.dart' as main_app;
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

Future main() async {
  DataHandler handler;
  handler = (String? message) async {
    // var locale = Locale(ui.window.locale.languageCode);
    // final localizations =
    //     await ExampleLocalizations.load(locale);
    var instanceHost =
        Platform.isAndroid ? 'http://10.0.2.2:4000' : 'http://localhost:4000';

    return Future.value(instanceHost);
  };

  enableFlutterDriverExtension(handler: handler);
  WidgetsApp.debugAllowBannerOverride = false; // remove debug banner
  await main_app.launchApp(appLaunchType: AppLaunchType.mock);
}
