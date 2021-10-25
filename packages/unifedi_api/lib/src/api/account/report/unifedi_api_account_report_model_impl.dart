import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../status/unifedi_api_status_model_impl.dart';
import '../unifedi_api_account_model_impl.dart';
import 'unifedi_api_account_report_model.dart';

part 'unifedi_api_account_report_model_impl.freezed.dart';

part 'unifedi_api_account_report_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiAccountReport
    with _$UnifediApiAccountReport
    implements IUnifediApiAccountReport {
  const factory UnifediApiAccountReport({
    @HiveField(0) required UnifediApiAccount? account,
    @HiveField(1) required List<UnifediApiStatus>? statuses,
    @HiveField(2) required UnifediApiAccount? user,
  }) = _UnifediApiAccountReport;

  factory UnifediApiAccountReport.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountReportFromJson(json);
}

extension IUnifediApiAccountReportInterfaceExtension
    on IUnifediApiAccountReport {
  UnifediApiAccountReport toUnifediApiAccountReport({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccountReport(
          account: account?.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses?.toUnifediApiStatusList(
            forceNewObject: forceNewObject,
          ),
          user: user?.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
