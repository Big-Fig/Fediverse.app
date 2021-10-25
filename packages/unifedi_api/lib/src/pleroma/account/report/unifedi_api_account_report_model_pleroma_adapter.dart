import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/report/unifedi_api_account_report_model.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../unifedi_api_account_model_pleroma_adapter.dart';

part 'unifedi_api_account_report_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_report_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountReportPleromaAdapter
    with _$UnifediApiAccountReportPleromaAdapter
    implements IUnifediApiAccountReport {
  const UnifediApiAccountReportPleromaAdapter._();
  const factory UnifediApiAccountReportPleromaAdapter(
    @HiveField(0) PleromaApiAccountReport value,
  ) = _UnifediApiAccountReportPleromaAdapter;

  @override
  IUnifediApiAccount? get account =>
      value.account?.toUnifediApiAccountPleromaAdapter();

  @override
  List<IUnifediApiStatus>? get statuses =>
      value.statuses?.toUnifediApiStatusPleromaAdapterList();

  @override
  IUnifediApiAccount? get user =>
      value.user?.toUnifediApiAccountPleromaAdapter();
  factory UnifediApiAccountReportPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountReportPleromaAdapterFromJson(json);
}

extension PleromaApiAccountReportUnifediExtension on IPleromaApiAccountReport {
  UnifediApiAccountReportPleromaAdapter
      toUnifediApiAccountReportPleromaAdapter() =>
          UnifediApiAccountReportPleromaAdapter(
            toPleromaApiAccountReport(),
          );
}

extension PleromaApiAccountReportUnifediListExtension
    on List<IPleromaApiAccountReport> {
  List<UnifediApiAccountReportPleromaAdapter>
      toUnifediApiAccountReportPleromaAdapterList() => map(
            (item) => item.toUnifediApiAccountReportPleromaAdapter(),
          ).toList();
}
