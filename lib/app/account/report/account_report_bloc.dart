import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
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

  Future send();
}
