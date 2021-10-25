import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../media/attachment/mastodon_api_media_attachment_model_impl.dart';
import 'mastodon_api_scheduled_status_model.dart';
import 'params/mastodon_api_scheduled_status_params_model_impl.dart';

part 'mastodon_api_scheduled_status_model_impl.freezed.dart';

part 'mastodon_api_scheduled_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiScheduledStatus
    with _$MastodonApiScheduledStatus
    implements IMastodonApiScheduledStatus {
  const factory MastodonApiScheduledStatus({
    @HiveField(0) @override required String id,
    @HiveField(1)
    @JsonKey(name: 'media_attachments')
        required List<MastodonApiMediaAttachment>? mediaAttachments,
    @HiveField(2) required MastodonApiScheduledStatusParams params,
    @HiveField(3) @JsonKey(name: 'scheduled_at') required DateTime scheduledAt,
  }) = _MastodonApiScheduledStatus;

  factory MastodonApiScheduledStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiScheduledStatusFromJson(json);
}

extension IMastodonApiScheduledStatusInterfaceExtension
    on IMastodonApiScheduledStatus {
  MastodonApiScheduledStatus toMastodonApiScheduledStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiScheduledStatus(
          id: id,
          mediaAttachments: mediaAttachments?.toMastodonApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          params: params.toMastodonApiScheduledStatusParams(
            forceNewObject: forceNewObject,
          ),
          scheduledAt: scheduledAt,
        ),
        forceNewObject: forceNewObject,
      );
}
