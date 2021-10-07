import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountActionMuteBloc implements IDisposable {
  static IAccountActionMuteBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountActionMuteBloc>(context, listen: listen);

  IAccount get accountForMute;

  IBoolValueFormFieldBloc get notificationsBoolFieldBloc;

  IDurationDateTimeValueFormFieldBloc get expireDurationFieldBloc;

  Future mute();
}
