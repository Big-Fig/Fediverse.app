import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusSensitiveDisplayTimeStorageBloc implements IDisposable {
  static IStatusSensitiveDisplayTimeStorageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusSensitiveDisplayTimeStorageBloc>(
        context,
        listen: listen,
      );

  DateTime? findStatusLastDisplayEnabledTime({
    required IStatus? status,
  });

  void onStatusDisplayEnabled({
    required IStatus? status,
  });
}
