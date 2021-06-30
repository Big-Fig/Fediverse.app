import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/push/push_model.dart';

abstract class IRichNotificationsService
    implements IAsyncInitLoadingBloc, IDisposable {
  Stream<PushMessage> get messageStream;
}
