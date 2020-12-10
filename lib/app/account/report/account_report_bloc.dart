import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountReportBloc implements IFormBloc {
  static IAccountReportBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountReportBloc>(context, listen: listen);

  bool get isAccountOnRemoteHost;

  IAccount get account;
  List<IStatus> get statuses;

  IStringValueFormFieldBloc get messageStringValueFormFieldBloc;

  IBoolValueFormFieldBloc get forwardBoolValueFormFieldBloc;

  Future<bool> send();
}
