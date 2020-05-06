import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSettingsBloc extends Disposable {
  static IMyAccountSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountSettingsBloc>(context, listen: listen);

  bool get isRealtimeWebSocketsEnabled;

  Stream<bool> get isRealtimeWebSocketsEnabledStream;

  void changeIsRealtimeWebSocketsEnabled(bool value);
}
