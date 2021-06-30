import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusActionMuteBloc implements IDisposable {
  static IStatusActionMuteBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusActionMuteBloc>(context, listen: listen);

  IStatus? get statusForMute;

  IDurationDateTimeValueFormFieldBloc get expireDurationFieldBloc;

  Future mute();
}
