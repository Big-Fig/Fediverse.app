import 'package:flutter/widgets.dart';

class GlobalOrInstanceSettings<T> {
  final T settings;
  final bool isGlobal;
  final bool isInstance;

  GlobalOrInstanceSettings({
    @required this.settings,
    @required this.isGlobal,
    @required this.isInstance,
  }) {
    assert(isGlobal || isInstance);
    assert(!(isGlobal && isInstance));
  }

  @override
  String toString() {
    return 'GlobalOrInstanceSettings{settings: $settings,'
        ' isGlobal: $isGlobal, isInstance: $isInstance}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalOrInstanceSettings &&
          runtimeType == other.runtimeType &&
          settings == other.settings &&
          isGlobal == other.isGlobal &&
          isInstance == other.isInstance;

  @override
  int get hashCode =>
      settings.hashCode ^ isGlobal.hashCode ^ isInstance.hashCode;
}
