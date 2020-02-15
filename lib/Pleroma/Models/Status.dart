// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import './Emoji.dart';

part 'Status.g.dart';



@JsonSerializable()
@NameTypeConverter()
class Application {
  Name name;
  dynamic website;

  Application({
    this.name,
    this.website,
  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  factory Application.fromJsonString(String jsonString) =>
      _$ApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  String toJsonString() => jsonEncode(_$ApplicationToJson(this));
}

enum Name { WEB }

final nameValues = new EnumValues({"Web": Name.WEB});


class NameTypeConverter implements JsonConverter<Name, String> {
  const NameTypeConverter();

  @override
  Name fromJson(String value) => nameValues.map[value];
  @override
  String toJson(Name value) => nameValues.reverseMap[value];

}

@JsonSerializable()
class Mention {
  String acct;
  String id;
  String url;
  String username;

  Mention({
    this.acct,
    this.id,
    this.url,
    this.username,
  });

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);

  factory Mention.fromJsonString(String jsonString) =>
      _$MentionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MentionToJson(this);

  String toJsonString() => jsonEncode(_$MentionToJson(this));
}

@JsonSerializable()
class StatusPleroma {
  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  Content content;
  // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: "conversation_id")
  int conversationId;
  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)
  @JsonKey(name: "direct_conversation_id")
  int directConversationId;
  // the acct property of User entity for replied user (if any)
  @JsonKey(name: "in_reply_to_account_acct")
  String inReplyToAccountAcct;
  bool local;
  @JsonKey(name: "spoiler_text")
  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  Content spoilerText;
  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  @JsonKey(name: "expires_at")
  // TODO: fix when https://git.pleroma.social/pleroma/pleroma/issues/1573
  //  will be resolved
//  DateTime expiresAt;
  dynamic expiresAt;
  @JsonKey(name: "thread_muted")
  bool threadMuted;
  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  @JsonKey(name: "emoji_reactions")
  List<EmojiReactions> emojiReactions;


  StatusPleroma({
    this.content,
    this.conversationId,
    this.inReplyToAccountAcct,
    this.local,
    this.spoilerText,
  });

  factory StatusPleroma.fromJson(Map<String, dynamic> json) =>
      _$StatusPleromaFromJson(json);

  factory StatusPleroma.fromJsonString(String jsonString) =>
      _$StatusPleromaFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$StatusPleromaToJson(this);

  String toJsonString() => jsonEncode(_$StatusPleromaToJson(this));
}

@JsonSerializable()
class Content {
  @JsonKey(name: "text/plain")
  String textPlain;

  Content({
    this.textPlain,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  factory Content.fromJsonString(String jsonString) =>
      _$ContentFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  String toJsonString() => jsonEncode(_$ContentToJson(this));
}

@JsonSerializable()
class Tag {
  String name;
  String url;

  Tag({
    this.name,
    this.url,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  factory Tag.fromJsonString(String jsonString) =>
      _$TagFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$TagToJson(this);

  String toJsonString() => jsonEncode(_$TagToJson(this));
}

enum Visibility { PUBLIC, UNLISTED, DIRECT, LIST }
enum VisibilityMastodon { PUBLIC, UNLISTED, DIRECT }

final visibilityValues = new EnumValues({
  "public": Visibility.PUBLIC,
  "unlisted": Visibility.UNLISTED,
  "direct": Visibility.DIRECT,
  "list": Visibility.LIST
});

final visibilityMastodonValues = new EnumValues({
  "public": VisibilityMastodon.PUBLIC,
  "unlisted": VisibilityMastodon.UNLISTED,
  "direct": VisibilityMastodon.DIRECT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class VisibilityTypeConverter implements JsonConverter<Visibility, String> {
  const VisibilityTypeConverter();

  @override
  Visibility fromJson(String value) => visibilityValues.map[value];
  @override
  String toJson(Visibility value) => visibilityValues.reverseMap[value];

}

class VisibilityMastodonTypeConverter implements JsonConverter<VisibilityMastodon, String> {
  const VisibilityMastodonTypeConverter();

  @override
  VisibilityMastodon fromJson(String value) => visibilityMastodonValues.map[value];
  @override
  String toJson(VisibilityMastodon value) => visibilityMastodonValues.reverseMap[value];

}
