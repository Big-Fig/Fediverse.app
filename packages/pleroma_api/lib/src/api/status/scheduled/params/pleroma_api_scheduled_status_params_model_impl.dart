import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../post/poll/pleroma_api_post_status_poll_model_impl.dart';
import 'pleroma_api_scheduled_status_params_model.dart';

part 'pleroma_api_scheduled_status_params_model_impl.freezed.dart';

part 'pleroma_api_scheduled_status_params_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiScheduledStatusParams
    with _$PleromaApiScheduledStatusParams
    implements IPleromaApiScheduledStatusParams {
  const factory PleromaApiScheduledStatusParams({
    @JsonKey(name: 'expires_in') @HiveField(0) required int? expiresInSeconds,
    @HiveField(1) required String? text,
    @JsonKey(name: 'media_ids') @HiveField(2) required List<String>? mediaIds,
    @HiveField(3) required bool sensitive,
    @JsonKey(name: 'spoiler_text') @HiveField(4) required String? spoilerText,
    @HiveField(5) required String visibility,
    @HiveField(6) required String? language,
    @JsonKey(name: 'scheduled_at') @HiveField(7) required DateTime scheduledAt,
    @HiveField(8) required PleromaApiPostStatusPoll? poll,
    @JsonKey(name: 'in_reply_to_id')
    @HiveField(10)
        required String? inReplyToId,
    @JsonKey(name: 'in_reply_to_conversation_id')
    @HiveField(12)
        required String? inReplyToConversationId,
    @JsonKey(name: 'to') @HiveField(13) required List<String>? to,
  }) = _PleromaApiScheduledStatusParams;

  factory PleromaApiScheduledStatusParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiScheduledStatusParamsFromJson(json);
}

extension IPleromaApiScheduledStatusParamsInterfaceExtension
    on IPleromaApiScheduledStatusParams {
  PleromaApiScheduledStatusParams toPleromaApiScheduledStatusParams({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiScheduledStatusParams(
          expiresInSeconds: expiresInSeconds,
          text: text,
          mediaIds: mediaIds,
          sensitive: sensitive,
          spoilerText: spoilerText,
          visibility: visibility,
          language: language,
          // todo: remove hack
          // ignore: avoid-non-null-assertion
          scheduledAt: scheduledAt!,
          poll: poll?.toPleromaApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          inReplyToId: inReplyToId,
          inReplyToConversationId: inReplyToConversationId,
          to: to,
        ),
        forceNewObject: forceNewObject,
      );
}
