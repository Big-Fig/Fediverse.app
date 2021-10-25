import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'poll/unifedi_api_post_status_poll_model_impl.dart';
import 'unifedi_api_post_status_model.dart';

part 'unifedi_api_post_status_model_impl.freezed.dart';

part 'unifedi_api_post_status_model_impl.g.dart';
// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiPostStatus
    with _$UnifediApiPostStatus
    implements IUnifediApiPostStatus {
  const factory UnifediApiPostStatus({
    @HiveField(0) @JsonKey(name: 'content_type') required String? contentType,
    @HiveField(1) @JsonKey(name: 'expires_in') required int? expiresInSeconds,
    @HiveField(2)
    @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
        required String? inReplyToConversationId,
    @HiveField(3)
    @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
        required String? inReplyToId,
    @HiveField(4) required String? language,
    @HiveField(5) required String visibility,
    @HiveField(6) @JsonKey(name: 'media_ids') required List<String>? mediaIds,
    @HiveField(7) required UnifediApiPostStatusPoll? poll,
    @HiveField(8) required bool? preview,
    @HiveField(9) required bool sensitive,
    @HiveField(10) @JsonKey(name: 'spoiler_text') required String? spoilerText,
    @HiveField(11) required String? status,
    @HiveField(12) required List<String>? to,
  }) = _UnifediApiPostStatus;

  factory UnifediApiPostStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusFromJson(json);
}

extension UnifediApiPostStatusInterfaceExtension on IUnifediApiPostStatus {
  UnifediApiPostStatus toUnifediApiPostStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPostStatus(
          contentType: contentType,
          expiresInSeconds: expiresInSeconds,
          inReplyToConversationId: inReplyToConversationId,
          inReplyToId: inReplyToId,
          language: language,
          visibility: visibility,
          mediaIds: mediaIds,
          poll: poll?.toUnifediApiPostStatusPoll(
            forceNewObject: forceNewObject,
          ),
          preview: preview,
          sensitive: sensitive,
          spoilerText: spoilerText,
          status: status,
          to: to,
        ),
        forceNewObject: forceNewObject,
      );
}
