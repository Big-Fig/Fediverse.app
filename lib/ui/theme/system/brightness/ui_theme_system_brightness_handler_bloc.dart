import 'dart:ui';

import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiThemeSystemBrightnessHandlerBloc extends Disposable {
  static IUiThemeSystemBrightnessHandlerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IUiThemeSystemBrightnessHandlerBloc>(context, listen: listen);

  Brightness get systemBrightness;

  Stream<Brightness> get systemBrightnessStream;

  void onSystemBrightnessChanged(Brightness brightness);
}
