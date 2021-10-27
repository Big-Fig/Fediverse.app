import 'dart:async';

import 'package:fedi_app/main.dart' as main_app;
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

// ignore_for_file: avoid-ignoring-return-values
Future main() async {
  DataHandler handler;
  handler = (String? message) async {
    var instanceHost = 'http://ops.pleroma.social';

    return Future.value(instanceHost);
  };

  enableFlutterDriverExtension(handler: handler);
  WidgetsApp.debugAllowBannerOverride = false; // remove debug banner
  await main_app.launchApp();
}
