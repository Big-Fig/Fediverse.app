import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/push/push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFcmPushService extends IDisposable
    implements IAsyncInitLoadingBloc {
  Stream<String> get deviceTokenStream;

  String? get deviceToken;

  Stream<PushMessage> get messageStream;

  PushMessage? get initialMessage;

  Future<bool> askPermissions();

  static IFcmPushService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFcmPushService>(context, listen: listen);

  void clearInitialMessage();
}
