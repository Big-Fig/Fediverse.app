import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSettingsBloc extends Disposable {
  static IMyAccountSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountSettingsBloc>(context, listen: listen);

  bool get isRealtimeWebSocketsEnabled;

  Stream<bool> get isRealtimeWebSocketsEnabledStream;

  bool get isNewChatsEnabled;

  Stream<bool> get isNewChatsEnabledStream;

  void changeIsNewChatsEnabled(bool value);
  void changeIsRealtimeWebSocketsEnabled(bool value);
}
