import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/mute/account_action_mute_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
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
    minDuration: Duration(seconds: 0),
    maxDuration: Duration(days: 366),
    isNullValuePossible: true,
    isEnabled: true,
  );

  @override
  final IBoolValueFormFieldBloc notificationsBoolFieldBloc =
      BoolValueFormFieldBloc(
    originValue: false,
  );

  AccountActionMuteBloc({
    @required this.accountBloc,
  }) {
    addDisposable(disposable: expireDurationFieldBloc);
    addDisposable(disposable: notificationsBoolFieldBloc);
  }

  static AccountActionMuteBloc createFromContext(
    BuildContext context, {
    @required IAccountBloc accountBloc,
  }) {
    return AccountActionMuteBloc(
      accountBloc: accountBloc,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required IAccountBloc accountBloc,
  }) {
    return DisposableProvider<IAccountActionMuteBloc>(
      create: (context) => AccountActionMuteBloc.createFromContext(
        context,
        accountBloc: accountBloc,
      ),
      child: child,
    );
  }

  @override
  Future mute() => accountBloc.mute(
      notifications: notificationsBoolFieldBloc.currentValue ?? false,
      duration: expireDurationFieldBloc.currentValueDuration,
    );
}
