import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class AccountReportBloc extends FormBloc implements IAccountReportBloc {
  @override
  final IAccount account;

  final IPleromaAccountService pleromaAccountService;

  @override
  List<IStatus> get selectedStatuses => selectedStatusesSubject.value;

  @override
  Stream<List<IStatus>> get selectedStatusesStream =>
      selectedStatusesSubject.stream;

  BehaviorSubject<List<IStatus>> selectedStatusesSubject;

  @override
  final IBoolValueFormFieldBloc forwardBoolValueFormFieldBloc =
      BoolValueFormFieldBloc(originValue: false);

  @override
  final IStringValueFormFieldBloc messageStringValueFormFieldBloc =
      StringValueFormFieldBloc(
    originValue: "",
    validators: [],
    maxLength: null,
  );

  AccountReportBloc({
    @required this.account,
    @required this.pleromaAccountService,
    @required List<IStatus> statuses,
  })  : selectedStatusesSubject =
            BehaviorSubject<List<IStatus>>.seeded(statuses ?? []),
        super(
          isAllItemsInitialized: true,
        ) {
    addDisposable(disposable: forwardBoolValueFormFieldBloc);
    addDisposable(disposable: messageStringValueFormFieldBloc);
    addDisposable(subject: selectedStatusesSubject);
  }

  @override
  List<IFormItemBloc> get currentItems => [
        forwardBoolValueFormFieldBloc,
        messageStringValueFormFieldBloc,
      ];

  @override
  bool get isAccountOnRemoteHost => account.isOnRemoteHost;

  @override
  Future<bool> send() async {
    var success = await pleromaAccountService.reportAccount(
      reportRequest: PleromaAccountReportRequest(
        accountId: account.remoteId,
        statusIds: selectedStatuses?.isNotEmpty == true
            ? selectedStatuses?.map((status) => status.remoteId)?.toList()
            : null,
        comment: messageStringValueFormFieldBloc.currentValue,
        forward: isAccountOnRemoteHost
            ? forwardBoolValueFormFieldBloc.currentValue
            : null,
      ),
    );

    return success;
  }
}
