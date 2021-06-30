import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:logging/logging.dart';

final _logger = Logger('account_report_bloc_impl.dart');

class AccountReportBloc extends FormBloc implements IAccountReportBloc {
  @override
  final IAccount account;

  final IPleromaApiAuthAccountService pleromaAuthAccountService;

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
    required this.pleromaAuthAccountService,
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
  Future<bool> send() async {
    var accountReportRequest = PleromaApiAccountReportRequest(
      accountId: account.remoteId,
      statusIds: statuses.isNotEmpty
          ? statuses.map((status) => status.remoteId!).toList()
          : null,
      comment: messageStringValueFormFieldBloc.currentValue,
      forward: isAccountOnRemoteHost
          ? forwardBoolValueFormFieldBloc.currentValue
          : null,
    );

    _logger.finest(() => 'send accountReportRequest $accountReportRequest');

    var success = await pleromaAuthAccountService.reportAccount(
      reportRequest: accountReportRequest,
    );

    return success;
  }

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
