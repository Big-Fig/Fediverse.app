import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentUnifediApiAccessContextInitBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static ICurrentUnifediApiAccessContextInitBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentUnifediApiAccessContextInitBloc>(
        context,
        listen: listen,
      );

  CurrentUnifediApiAccessContextInitState? get state;

  Stream<CurrentUnifediApiAccessContextInitState> get stateStream;

  Future<void> refreshFromNetwork({required bool isNeedWaitForOptionalData});
}
