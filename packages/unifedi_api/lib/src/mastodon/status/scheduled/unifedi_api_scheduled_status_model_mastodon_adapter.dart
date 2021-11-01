import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../../api/status/scheduled/params/unifedi_api_scheduled_status_params_model.dart';
import '../../../api/status/scheduled/unifedi_api_scheduled_status_model.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_mastodon_adapter.dart';
import 'params/unifedi_api_scheduled_status_params_model_mastodon_adapter.dart';

part 'unifedi_api_scheduled_status_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_scheduled_status_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiScheduledStatusMastodonAdapter
    with _$UnifediApiScheduledStatusMastodonAdapter
    implements IUnifediApiScheduledStatus {
  const UnifediApiScheduledStatusMastodonAdapter._();
  const factory UnifediApiScheduledStatusMastodonAdapter(
    @HiveField(0) MastodonApiScheduledStatus value,
  ) = _UnifediApiScheduledStatusMastodonAdapter;

  @override
  String get id => value.id;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      value.mediaAttachments?.toUnifediApiMediaAttachmentMastodonAdapterList();

  @override
  IUnifediApiScheduledStatusParams get params => value.params
      .copyWith(scheduledAt: scheduledAt)
      .toUnifediApiScheduledStatusParamsMastodonAdapter();

  @override
  DateTime get scheduledAt => value.scheduledAt;
  factory UnifediApiScheduledStatusMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusMastodonAdapterFromJson(json);
}

extension MastodonApiScheduledStatusUnifediExtension
    on IMastodonApiScheduledStatus {
  UnifediApiScheduledStatusMastodonAdapter
      toUnifediApiScheduledStatusMastodonAdapter() =>
          UnifediApiScheduledStatusMastodonAdapter(
            toMastodonApiScheduledStatus(),
          );
}

extension MastodonApiScheduledStatusUnifediListExtension
    on List<IMastodonApiScheduledStatus> {
  List<UnifediApiScheduledStatusMastodonAdapter>
      toUnifediApiScheduledStatusMastodonAdapterList() => map(
            (item) => item.toUnifediApiScheduledStatusMastodonAdapter(),
          ).toList();
}
