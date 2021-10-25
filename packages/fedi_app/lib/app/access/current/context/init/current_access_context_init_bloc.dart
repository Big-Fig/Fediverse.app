import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAccessContextInitBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static ICurrentAccessContextInitBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentAccessContextInitBloc>(
        context,
        listen: listen,
      );

  CurrentAccessContextInitState? get state;

  Stream<CurrentAccessContextInitState> get stateStream;

  Future<void> refreshFromNetwork({required bool isNeedWaitForOptionalData});
}
