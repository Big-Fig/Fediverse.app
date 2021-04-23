import 'dart:convert';

import 'package:fedi/mastodon/api/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'pleroma_notification_model.g.dart';

abstract class IPleromaNotification extends IMastodonNotification {
  @override
  IPleromaAccount? get account;

  IPleromaAccount? get target;

  @override
  IPleromaStatus? get status;

  IPleromaChatMessage? get chatMessage;

  PleromaNotificationType? get typePleroma;

  String? get emoji;

  PleromaNotificationPleromaPart? get pleroma;

  IPleromaAccountReport? get report;
}

enum PleromaNotificationType {
  follow,
  favourite,
  reblog,
  mention,
  poll,
  move,
  followRequest,
  pleromaEmojiReaction,
  pleromaChatMention,
  pleromaReport,
  unknown,
}

const unknownPleromaNotificationType = PleromaNotificationType.unknown;

const _followPleromaNotificationTypeJsonValue = "follow";
const _favouritePleromaNotificationTypeJsonValue = "favourite";
const _reblogPleromaNotificationTypeJsonValue = "reblog";
const _mentionPleromaNotificationTypeJsonValue = "mention";
const _pollPleromaNotificationTypeJsonValue = "poll";
const _movePleromaNotificationTypeJsonValue = "move";
const _followRequestPleromaNotificationTypeJsonValue = "follow_request";
const _pleromaEmojiReactionRequestPleromaNotificationTypeJsonValue =
    "pleroma:emoji_reaction";
const _pleromaChatMentionRequestPleromaNotificationTypeJsonValue =
    "pleroma:chat_mention";
const _pleromaReportRequestPleromaNotificationTypeJsonValue = "pleroma:report";
const _unknownRequestPleromaNotificationTypeJsonValue = "unknown";

extension PleromaNotificationTypeListExtension
    on List<PleromaNotificationType> {
  List<String> toPleromaNotificationTypeStrings() => map(
        (notificationType) => notificationType.toJsonValue(),
      ).toList();

  List<PleromaNotificationType> valuesWithoutSelected(
    List<PleromaNotificationType> valuesToExclude,
  ) =>
      where(
        (value) => !valuesToExclude.contains(
          value,
        ),
      ).toList();
}

extension PleromaNotificationTypeExtension on PleromaNotificationType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaNotificationType.follow:
        result = _followPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.favourite:
        result = _favouritePleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.reblog:
        result = _reblogPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.mention:
        result = _mentionPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.poll:
        result = _pollPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.move:
        result = _movePleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.followRequest:
        result = _followRequestPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.pleromaEmojiReaction:
        result = _pleromaEmojiReactionRequestPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.pleromaChatMention:
        result = _pleromaChatMentionRequestPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.pleromaReport:
        result = _pleromaReportRequestPleromaNotificationTypeJsonValue;
        break;
      case PleromaNotificationType.unknown:
        result = _unknownRequestPleromaNotificationTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaNotificationTypeStringExtension on String {
  PleromaNotificationType toPleromaNotificationType() {
    PleromaNotificationType result;

    switch (this) {
      case _followPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.follow;
        break;
      case _movePleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.move;
        break;
      case _favouritePleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.favourite;
        break;
      case _pollPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.poll;
        break;
      case _mentionPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.mention;
        break;
      case _reblogPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.reblog;
        break;
      case _followRequestPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.followRequest;
        break;
      case _pleromaChatMentionRequestPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.pleromaChatMention;
        break;
      case _pleromaEmojiReactionRequestPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.pleromaEmojiReaction;
        break;
      case _pleromaReportRequestPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.pleromaReport;
        break;
      case _unknownRequestPleromaNotificationTypeJsonValue:
        result = PleromaNotificationType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownPleromaNotificationType;
        break;
    }

    return result;
  }
}

extension PleromaNotificationTypeStringPollExtension on List<String> {
  List<PleromaNotificationType> toPleromaVisibilities() => map(
        (notificationTypeString) =>
            notificationTypeString.toPleromaNotificationType(),
      ).toList();
}

class PleromaNotificationTypeTypeConverter
    implements
        JsonConverter<PleromaNotificationType, String?>,
        moor.TypeConverter<PleromaNotificationType, String?> {
  const PleromaNotificationTypeTypeConverter();

  @override
  PleromaNotificationType fromJson(String? value) =>
      value?.toPleromaNotificationType() ?? unknownPleromaNotificationType;

  @override
  String? toJson(PleromaNotificationType? value) => value?.toJsonValue();

  @override
  PleromaNotificationType? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(PleromaNotificationType? value) => toJson(value);
}

@JsonSerializable()
class PleromaNotificationPleromaPart {
  @JsonKey(name: "is_seen")
  final bool? isSeen;
  @JsonKey(name: "is_muted")
  final bool? isMuted;

  PleromaNotificationPleromaPart({
    required this.isSeen,
    required this.isMuted,
  });

  PleromaNotificationPleromaPart copyWith({
    bool? isSeen,
    bool? isMuted,
  }) =>
      PleromaNotificationPleromaPart(
        isSeen: isSeen ?? this.isSeen,
        isMuted: isMuted ?? this.isMuted,
      );

  factory PleromaNotificationPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaNotificationPleromaPartFromJson(json);

  factory PleromaNotificationPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaNotificationPleromaPartFromJson(jsonDecode(jsonString));

  static List<PleromaNotificationPleromaPart> listFromJsonString(String str) =>
      List<PleromaNotificationPleromaPart>.from(json
          .decode(str)
          .map((x) => PleromaNotificationPleromaPart.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaNotificationPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaNotificationPleromaPartToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaNotification extends IPleromaNotification {
  @override
  final PleromaAccount? account;
  @override
  final PleromaAccount? target;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final String id;
  @override
  final String type;
  @override
  final PleromaStatus? status;
  @override
  final String? emoji;
  @override
  final PleromaNotificationPleromaPart? pleroma;

  @override
  @JsonKey(name: "chat_message")
  final PleromaChatMessage? chatMessage;

  @override
  final PleromaAccountReport? report;

  PleromaNotification({
    required this.account,
    required this.createdAt,
    required this.id,
    required this.type,
    required this.status,
    required this.chatMessage,
    required this.emoji,
    required this.pleroma,
    required this.report,
    required this.target,
  });

  factory PleromaNotification.fromJson(Map<String, dynamic> json) =>
      _$PleromaNotificationFromJson(json);

  factory PleromaNotification.fromJsonString(String jsonString) =>
      _$PleromaNotificationFromJson(jsonDecode(jsonString));

  static List<PleromaNotification> listFromJsonString(String str) =>
      List<PleromaNotification>.from(
        json.decode(str).map((x) => PleromaNotification.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaNotificationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaNotificationToJson(this));

  @override
  String toString() {
    return 'PleromaNotification{'
        'id: $id, '
        'account: $account, '
        'createdAt: $createdAt, '
        'type: $type, '
        'status: $status'
        '}';
  }

  @override
  MastodonNotificationType get typeMastodon =>
      type.toMastodonNotificationType();

  @override
  PleromaNotificationType? get typePleroma => type.toPleromaNotificationType();
}
