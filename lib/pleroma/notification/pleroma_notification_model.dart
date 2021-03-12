import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_notification_model.g.dart';

abstract class IPleromaNotification extends IMastodonNotification {
  @override
  IPleromaAccount get account;

  IPleromaAccount get target;

  @override
  IPleromaStatus get status;

  IPleromaChatMessage get chatMessage;

  PleromaNotificationType get typePleroma;

  String get emoji;

  PleromaNotificationPleromaPart get pleroma;

  dynamic get report;
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
  unknown
}

final pleromaNotificationTypeValues = EnumValues({
  "follow": PleromaNotificationType.follow,
  "favourite": PleromaNotificationType.favourite,
  "reblog": PleromaNotificationType.reblog,
  "mention": PleromaNotificationType.mention,
  "poll": PleromaNotificationType.poll,
  "move": PleromaNotificationType.move,
  "follow_request": PleromaNotificationType.followRequest,
  "pleroma:emoji_reaction": PleromaNotificationType.pleromaEmojiReaction,
  "pleroma:chat_mention": PleromaNotificationType.pleromaChatMention,
});

extension PleromaNotificationTypeJsonValueExtension on PleromaNotificationType {
  String toJsonValue() => pleromaNotificationTypeValues.enumToValueMap[this];
}

extension PleromaNotificationTypeStringExtension on String {
  PleromaNotificationType toPleromaNotificationType() {
    var pleromaNotificationType =
        pleromaNotificationTypeValues.valueToEnumMap[this];
    if (pleromaNotificationType == null) {
      return PleromaNotificationType.unknown;
    }
    return pleromaNotificationType;
  }
}

@JsonSerializable()
class PleromaNotificationPleromaPart {
  @JsonKey(name: "is_seen")
  final bool isSeen;
  @JsonKey(name: "is_muted")
  final bool isMuted;

  PleromaNotificationPleromaPart({
    @required this.isSeen,
    @required this.isMuted,
  });

  PleromaNotificationPleromaPart copyWith({
    bool isSeen,
    bool isMuted,
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
  final PleromaAccount account;
  @override
  final PleromaAccount target;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  final String id;
  @override
  final String type;
  @override
  final PleromaStatus status;
  @override
  final String emoji;
  @override
  final PleromaNotificationPleromaPart pleroma;

  @override
  @JsonKey(name: "chat_message")
  final PleromaChatMessage chatMessage;

  @override
  final PleromaAccountReport report;

  PleromaNotification({
    @required this.account,
    @required this.createdAt,
    @required this.id,
    @required this.type,
    @required this.status,
    @required this.chatMessage,
    @required this.emoji,
    @required this.pleroma,
    @required this.report,
    @required this.target,
  });

  factory PleromaNotification.fromJson(Map<String, dynamic> json) =>
      _$PleromaNotificationFromJson(json);

  factory PleromaNotification.fromJsonString(String jsonString) =>
      _$PleromaNotificationFromJson(jsonDecode(jsonString));

  static List<PleromaNotification> listFromJsonString(String str) =>
      List<PleromaNotification>.from(
          json.decode(str).map((x) => PleromaNotification.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaNotificationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaNotificationToJson(this));

  @override
  String toString() {
    return 'PleromaNotification{id: $id, account: $account, createdAt: '
        '$createdAt, type: $type, status: $status}';
  }

  @override
  MastodonNotificationType get typeMastodon =>
      mastodonNotificationTypeValues.valueToEnumMap[type];

  @override
  PleromaNotificationType get typePleroma {
    if (pleromaNotificationTypeValues.valueToEnumMap.containsKey(type)) {
      return pleromaNotificationTypeValues.valueToEnumMap[type];
    } else {
      return PleromaNotificationType.unknown;
    }
  }
}
