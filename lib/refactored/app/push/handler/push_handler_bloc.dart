import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';

typedef Future<bool> IPushRealTimeHandler(
    PleromaPushMessage pleromaPushMessage);

abstract class IPushHandlerBloc extends Disposable {
  List<PleromaPushMessage> loadUnhandledMessagesForInstance(
      AuthInstance instance);

  Future<bool> markAsHandled(List<PleromaPushMessage> messages);

  void addRealTimeHandler(IPushRealTimeHandler pushHandler);

  void removeRealTimeHandler(IPushRealTimeHandler pushHandler);
}
