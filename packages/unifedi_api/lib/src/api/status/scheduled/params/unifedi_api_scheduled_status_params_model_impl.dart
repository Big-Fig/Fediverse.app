import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../post/poll/unifedi_api_post_status_poll_model_impl.dart';
import 'unifedi_api_scheduled_status_params_model.dart';

part 'unifedi_api_scheduled_status_params_model_impl.freezed.dart';

part 'unifedi_api_scheduled_status_params_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiScheduledStatusParams
    with _$UnifediApiScheduledStatusParams
    implements IUnifediApiScheduledStatusParams {
  const factory UnifediApiScheduledStatusParams({
    @JsonKey(name: 'expires_in') @HiveField(0) required int? expiresInSeconds,
    @HiveField(1) required String? text,
    @JsonKey(name: 'media_ids') @HiveField(2) required List<String>? mediaIds,
    @HiveField(3) required bool sensitive,
    @JsonKey(name: 'spoiler_text') @HiveField(4) required String? spoilerText,
    @HiveField(5) required String visibility,
    @HiveField(6) required String? language,
    @JsonKey(name: 'scheduled_at') @HiveField(7) required DateTime scheduledAt,
    @HiveField(8) required UnifediApiPostStatusPoll? poll,
    @JsonKey(name: 'in_reply_to_id')
    @HiveField(10)
        required String? inReplyToId,
    @JsonKey(name: 'in_reply_to_conversation_id')
    @HiveField(12)
        required String? inReplyToConversationId,
    @JsonKey(name: 'to') @HiveField(13) required List<String>? to,
  }) = _UnifediApiScheduledStatusParams;

  factory UnifediApiScheduledStatusParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusParamsFromJson(json);
}

extension IUnifediApiScheduledStatusParamsInterfaceExtension
    on IUnifediApiScheduledStatusParams {
  UnifediApiScheduledStatusParams toUnifediApiScheduledStatusParams({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiScheduledStatusParams(
          expiresInSeconds: expiresInSeconds,
          text: text,
          mediaIds: mediaIds,
          sensitive: sensitive,
          spoilerText: spoilerText,
          visibility: visibility,
          language: language,
          scheduledAt: scheduledAt,
          poll: poll?.toUnifediApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          inReplyToId: inReplyToId,
          inReplyToConversationId: inReplyToConversationId,
          to: to,
        ),
        forceNewObject: forceNewObject,
      );
}
