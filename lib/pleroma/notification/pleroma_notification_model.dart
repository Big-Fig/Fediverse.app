import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_notification_model.g.dart';

abstract class IPleromaNotification extends IMastodonNotification {
  @override
  IPleromaAccount get account;

  @override
  IPleromaStatus get status;

  IPleromaChatMessage get chatMessage;

  PleromaNotificationType get typePleroma;

  String get emoji;

  PleromaNotificationPleromaPart get pleroma;

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

@JsonSerializable()
class PleromaNotificationPleromaPart {
  @JsonKey(name: "is_seen")
  final bool isSeen;

  PleromaNotificationPleromaPart({this.isSeen});

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
  PleromaChatMessage chatMessage;


  PleromaNotification({
    this.account,
    this.createdAt,
    this.id,
    this.type,
    this.status,
    this.chatMessage,
    this.emoji,
    this.pleroma,
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
      mastodonNotificationTypeValues.map[type];

  @override
  PleromaNotificationType get typePleroma {
    if (pleromaNotificationTypeValues.map.containsKey(type)) {
      return pleromaNotificationTypeValues.map[type];
    } else {
      return PleromaNotificationType.unknown;
    }
  }
}
