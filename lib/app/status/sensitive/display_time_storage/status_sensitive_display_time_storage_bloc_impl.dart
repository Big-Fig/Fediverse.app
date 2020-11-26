import 'dart:collection';
import 'dart:core';

import 'package:fedi/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class StatusSensitiveDisplayTimeStorageBloc extends DisposableOwner
    implements IStatusSensitiveDisplayTimeStorageBloc {
  // todo: perhaps remove old values to less memory usage
  final HashMap<String, DateTime> _statusIdToTimeMap = HashMap();

  @override
  DateTime findStatusLastDisplayEnabledTime({
    @required IStatus status,
  }) =>
      _statusIdToTimeMap[status.remoteId];

  @override
  void onStatusDisplayEnabled({
    @required IStatus status,
  }) {
    _statusIdToTimeMap[status.remoteId] = DateTime.now();
  }
}
