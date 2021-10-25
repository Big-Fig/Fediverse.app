import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../../api/status/scheduled/params/unifedi_api_scheduled_status_params_model.dart';
import '../../../api/status/scheduled/unifedi_api_scheduled_status_model.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_pleroma_adapter.dart';
import 'params/unifedi_api_scheduled_status_params_model_pleroma_adapter.dart';

part 'unifedi_api_scheduled_status_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_scheduled_status_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiScheduledStatusPleromaAdapter
    with _$UnifediApiScheduledStatusPleromaAdapter
    implements IUnifediApiScheduledStatus {
  const UnifediApiScheduledStatusPleromaAdapter._();
  const factory UnifediApiScheduledStatusPleromaAdapter(
    @HiveField(0) PleromaApiScheduledStatus value,
  ) = _UnifediApiScheduledStatusPleromaAdapter;

  @override
  String get id => value.id;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      value.mediaAttachments?.toUnifediApiMediaAttachmentPleromaAdapterList();

  @override
  IUnifediApiScheduledStatusParams get params =>
      value.params.toUnifediApiScheduledStatusParamsPleromaAdapter();

  @override
  DateTime get scheduledAt => value.scheduledAt;
  factory UnifediApiScheduledStatusPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusPleromaAdapterFromJson(json);
}

extension PleromaApiScheduledStatusUnifediExtension
    on IPleromaApiScheduledStatus {
  UnifediApiScheduledStatusPleromaAdapter
      toUnifediApiScheduledStatusPleromaAdapter() =>
          UnifediApiScheduledStatusPleromaAdapter(
            toPleromaApiScheduledStatus(),
          );
}

extension PleromaApiScheduledStatusUnifediListExtension
    on List<IPleromaApiScheduledStatus> {
  List<UnifediApiScheduledStatusPleromaAdapter>
      toUnifediApiScheduledStatusPleromaAdapterList() => map(
            (item) => item.toUnifediApiScheduledStatusPleromaAdapter(),
          ).toList();
}
