import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/push/push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFcmPushService extends Disposable implements IAsyncInitLoadingBloc {
  Stream<String> get deviceTokenStream;

  String get deviceToken;

  Stream<PushMessage> get messageStream;
  Future askPermissions();


  static IFcmPushService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFcmPushService>(context, listen: listen);
}
