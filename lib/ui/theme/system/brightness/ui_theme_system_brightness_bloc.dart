import 'dart:ui';

import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiThemeSystemBrightnessBloc extends IDisposable {
  static IUiThemeSystemBrightnessBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IUiThemeSystemBrightnessBloc>(context, listen: listen);

  Brightness get systemBrightness;

  Stream<Brightness> get systemBrightnessStream;

  void onSystemBrightnessChanged(Brightness brightness);
}
