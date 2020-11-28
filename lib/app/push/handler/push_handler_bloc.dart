import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef Future<bool> IPushRealTimeHandler(
    PushHandlerMessage pushHandlerMessage);

abstract class IPushHandlerBloc extends IDisposable {
  static IPushHandlerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPushHandlerBloc>(context, listen: listen);

  List<PushHandlerMessage> loadUnhandledMessagesForInstance(
      AuthInstance instance);

  Future<bool> markAsHandled(List<PushHandlerMessage> messages);

  Future markAsLaunchMessage(PushHandlerMessage message);

  void addRealTimeHandler(IPushRealTimeHandler pushHandler);

  void removeRealTimeHandler(IPushRealTimeHandler pushHandler);
}
