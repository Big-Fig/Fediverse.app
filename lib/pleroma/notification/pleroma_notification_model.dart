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
  pleromaChatMention
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
class PleromaNotification extends IPleromaNotification {
  @override
  PleromaAccount account;
  @override
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @override
  String id;
  @override
  String type;
  @override
  PleromaStatus status;

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
    return 'PleromaNotification{account: $account, createdAt: $createdAt, id: $id,'
        ' type: $type, status: $status}';
  }

  @override
  MastodonNotificationType get typeMastodon =>
      mastodonNotificationTypeValues.map[type];

  @override
  PleromaNotificationType get typePleroma =>
      pleromaNotificationTypeValues.map[type];
}
