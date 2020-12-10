import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountReportBloc implements IFormBloc {
  bool get isAccountOnRemoteHost;

  static IAccountReportBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountReportBloc>(context, listen: listen);

  IAccount get account;

  IStringValueFormFieldBloc get messageStringValueFormFieldBloc;

  IBoolValueFormFieldBloc get forwardBoolValueFormFieldBloc;

  List<IStatus> get selectedStatuses;

  Stream<List<IStatus>> get selectedStatusesStream;

  Future<bool> send();
}
