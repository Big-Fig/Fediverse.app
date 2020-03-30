import 'package:flutter/widgets.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final Function(AppLifecycleState appLifecycleState) callback;

  LifecycleEventHandler(this.callback);

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    callback(state);
  }
}
