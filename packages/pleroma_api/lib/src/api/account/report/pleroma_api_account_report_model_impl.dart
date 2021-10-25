import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../status/pleroma_api_status_model_impl.dart';
import '../pleroma_api_account_model_impl.dart';
import 'pleroma_api_account_report_model.dart';

part 'pleroma_api_account_report_model_impl.freezed.dart';

part 'pleroma_api_account_report_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiAccountReport
    with _$PleromaApiAccountReport
    implements IPleromaApiAccountReport {
  const factory PleromaApiAccountReport({
    @HiveField(0) required PleromaApiAccount? account,
    @HiveField(1) required List<PleromaApiStatus>? statuses,
    @HiveField(2) required PleromaApiAccount? user,
  }) = _PleromaApiAccountReport;

  factory PleromaApiAccountReport.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountReportFromJson(json);
}

extension IPleromaApiAccountReportInterfaceExtension
    on IPleromaApiAccountReport {
  PleromaApiAccountReport toPleromaApiAccountReport({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccountReport(
          account: account?.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses?.toPleromaApiStatusList(
            forceNewObject: forceNewObject,
          ),
          user: user?.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
