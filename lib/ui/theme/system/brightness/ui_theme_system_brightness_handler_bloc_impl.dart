import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class UiThemeSystemBrightnessHandlerBloc extends DisposableOwner
    implements IUiThemeSystemBrightnessHandlerBloc {
  final BehaviorSubject<Brightness> systemBrightnessSubject =
      BehaviorSubject.seeded(Brightness.light);

  UiThemeSystemBrightnessHandlerBloc() {
    addDisposable(subject: systemBrightnessSubject);
  }

  @override
  void onSystemBrightnessChanged(brightness) {
    systemBrightnessSubject.add(brightness);
  }

  @override
  Brightness get systemBrightness => systemBrightnessSubject.value;

  @override
  Stream<Brightness> get systemBrightnessStream =>
      systemBrightnessSubject.stream.distinct();
}
