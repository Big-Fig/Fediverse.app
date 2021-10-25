import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi_app/push/push_model.dart';

abstract class IRichNotificationsService
    implements IAsyncInitLoadingBloc, IDisposable {
  Stream<PushMessage> get messageStream;
}
