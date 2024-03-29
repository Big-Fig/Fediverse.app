import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/action/mute/account_action_mute_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:flutter/material.dart';

class AccountActionMuteBloc extends DisposableOwner
    implements IAccountActionMuteBloc {
  final IAccountBloc accountBloc;

  @override
  IAccount get accountForMute => accountBloc.account;

  @override
  final IDurationDateTimeValueFormFieldBloc expireDurationFieldBloc =
      DurationDateTimeValueFormFieldBloc(
    originValue: null,
    minDuration: const Duration(hours: 1),
    // 1 year
    // ignore: no-magic-number
    maxDuration: const Duration(days: 366),
    isNullValuePossible: true,
    isEnabled: true,
  );

  @override
  final IBoolValueFormFieldBloc notificationsBoolFieldBloc =
      BoolValueFormFieldBloc(
    originValue: false,
  );

  AccountActionMuteBloc({
    required this.accountBloc,
  }) {
    expireDurationFieldBloc.disposeWith(this);
    notificationsBoolFieldBloc.disposeWith(this);
  }

  static AccountActionMuteBloc createFromContext(
    BuildContext context, {
    required IAccountBloc accountBloc,
  }) =>
      AccountActionMuteBloc(
        accountBloc: accountBloc,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IAccountBloc accountBloc,
  }) =>
      DisposableProvider<IAccountActionMuteBloc>(
        create: (context) => AccountActionMuteBloc.createFromContext(
          context,
          accountBloc: accountBloc,
        ),
        child: child,
      );

  @override
  Future<void> mute() => accountBloc.mute(
        notifications: notificationsBoolFieldBloc.currentValue ?? false,
        duration: expireDurationFieldBloc.currentValueDuration,
      );
}
