import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/status/action/mute/status_action_mute_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:flutter/material.dart';

class StatusActionMuteBloc extends DisposableOwner
    implements IStatusActionMuteBloc {
  final IStatusBloc statusBloc;

  @override
  IStatus? get statusForMute => statusBloc.status;

  @override
  final IDurationDateTimeValueFormFieldBloc expireDurationFieldBloc =
      DurationDateTimeValueFormFieldBloc(
    originValue: null,
    minDuration: Duration(hours: 1),
    // ignore: no-magic-number
    maxDuration: Duration(days: 366),
    isNullValuePossible: true,
    isEnabled: true,
  );

  StatusActionMuteBloc({
    required this.statusBloc,
  }) {
    addDisposable(expireDurationFieldBloc);
  }

  static StatusActionMuteBloc createFromContext(
    BuildContext context, {
    required IStatusBloc statusBloc,
  }) =>
      StatusActionMuteBloc(
        statusBloc: statusBloc,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IStatusBloc statusBloc,
  }) =>
      DisposableProvider<IStatusActionMuteBloc>(
        create: (context) => StatusActionMuteBloc.createFromContext(
          context,
          statusBloc: statusBloc,
        ),
        child: child,
      );

  @override
  Future mute() => statusBloc.mute(
        duration: expireDurationFieldBloc.currentValueDuration,
      );
}
