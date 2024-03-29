import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/report/account_report_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountReportBloc extends FormBloc implements IAccountReportBloc {
  @override
  final IAccount account;

  final IUnifediApiAccountService unifediAuthAccountService;

  @override
  final IBoolValueFormFieldBloc forwardBoolValueFormFieldBloc =
      BoolValueFormFieldBloc(originValue: false);

  @override
  final IStringValueFormFieldBloc messageStringValueFormFieldBloc =
      StringValueFormFieldBloc(
    originValue: '',
    validators: [],
    maxLength: null,
  );

  @override
  final List<IStatus> statuses;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  AccountReportBloc({
    required this.account,
    required this.unifediAuthAccountService,
    required this.statuses,
  }) : super(
          isAllItemsInitialized: true,
        ) {
    forwardBoolValueFormFieldBloc.disposeWith(this);
    messageStringValueFormFieldBloc.disposeWith(this);
  }

  @override
  List<IFormItemBloc> get currentItems => [
        forwardBoolValueFormFieldBloc,
        messageStringValueFormFieldBloc,
      ];

  @override
  bool get isAccountOnRemoteHost => account.isAcctOnRemoteHost;

  @override
  Future<void> send() => unifediAuthAccountService.reportAccount(
        accountId: account.remoteId,
        statusIds: statuses.isNotEmpty
            ? statuses.map((status) => status.remoteId!).toList()
            : null,
        comment: messageStringValueFormFieldBloc.currentValue,
        forward: isAccountOnRemoteHost
            ? forwardBoolValueFormFieldBloc.currentValue
            : null,
      );

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
