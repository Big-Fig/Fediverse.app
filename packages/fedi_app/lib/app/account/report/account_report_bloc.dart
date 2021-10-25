import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountReportBloc implements IFormBloc, IStatusListBloc {
  static IAccountReportBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountReportBloc>(context, listen: listen);

  bool get isAccountOnRemoteHost;

  @override
  InstanceLocation get instanceLocation;

  IAccount get account;

  List<IStatus> get statuses;

  IStringValueFormFieldBloc get messageStringValueFormFieldBloc;

  IBoolValueFormFieldBloc get forwardBoolValueFormFieldBloc;

  Future<void> send();
}
