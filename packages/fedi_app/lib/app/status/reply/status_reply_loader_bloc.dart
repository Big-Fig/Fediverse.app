import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusReplyLoaderBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static IStatusReplyLoaderBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusReplyLoaderBloc>(context, listen: listen);

  IStatus get originalStatus;

  IStatus? get inReplyToStatus;
}
