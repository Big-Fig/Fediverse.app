// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/Models/card.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';

import './Account.dart';
import './Emoji.dart';

part 'Status.g.dart';

@JsonSerializable()
@VisibilityTypeConverter()
class Status {
  String id;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "in_reply_to_id")
  String inReplyToId;
  @JsonKey(name: "in_reply_to_account_id")
  String inReplyToAccountId;
  bool sensitive;
  @JsonKey(name: "spoiler_text")
  String spoilerText;
  Visibility visibility;
  String uri;
  String url;
  @JsonKey(name: "replies_count")
  int repliesCount;
  @JsonKey(name: "reblogs_count")
  int reblogsCount;
  @JsonKey(name: "favourites_count")
  int favouritesCount;
  bool favourited;
  bool reblogged;
  bool muted;
  bool bookmarked;
  String content;
  Status reblog;
  Application application;
  Account account;
  @JsonKey(name: "media_attachments")
  List<MediaAttachment> mediaAttachments;
  List<Mention> mentions;
  List<Tag> tags;
  List<Emoji> emojis;
  Card card;
  dynamic poll;

  Status({
    this.id,
    this.createdAt,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.sensitive,
    this.spoilerText,
    this.visibility,
    this.uri,
    this.url,
    this.repliesCount,
    this.reblogsCount,
    this.favouritesCount,
    this.favourited,
    this.reblogged,
    this.muted,
    this.bookmarked,
    this.content,
    this.reblog,
    this.application,
    this.account,
    this.mediaAttachments,
    this.mentions,
    this.tags,
    this.emojis,
    this.card,
    this.poll,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  factory Status.fromJsonString(String jsonString) =>
      _$StatusFromJson(jsonDecode(jsonString));

  static List<Status> listFromJsonString(String str) =>
      new List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  String toJsonString() => jsonEncode(_$StatusToJson(this));

  @override
  String toString() {
    return 'Status{id: $id, createdAt: $createdAt, inReplyToId: $inReplyToId,'
        ' inReplyToAccountId: $inReplyToAccountId, sensitive: $sensitive,'
        ' spoilerText: $spoilerText, visibility: $visibility,'
        ' uri: $uri, url: $url, repliesCount: $repliesCount,'
        ' reblogsCount: $reblogsCount, favouritesCount: $favouritesCount,'
        ' favourited: $favourited, reblogged: $reblogged, muted: $muted,'
        ' bookmarked: $bookmarked, content: $content, reblog: $reblog,'
        ' application: $application, account: $account,'
        ' mediaAttachments: $mediaAttachments, mentions: $mentions,'
        ' tags: $tags, emojis: $emojis, poll: $poll}';
  }


}

@JsonSerializable()
class AccountPleroma {
  @JsonKey(name: "background_image")
  dynamic backgroundImage;
  @JsonKey(name: "confirmation_pending")
  bool confirmationPending;
  @JsonKey(name: "hide_favorites")
  bool hideFavorites;
  @JsonKey(name: "hide_followers")
  bool hideFollowers;
  @JsonKey(name: "hide_follows")
  bool hideFollows;
  @JsonKey(name: "is_admin")
  bool isAdmin;
  @JsonKey(name: "is_moderator")
  bool isModerator;
  Relationship relationship;
  @JsonKey(name: "skip_thread_containment")
  bool skipThreadContainment;
  List<dynamic> tags;

  AccountPleroma({
    this.backgroundImage,
    this.confirmationPending,
    this.hideFavorites,
    this.hideFollowers,
    this.hideFollows,
    this.isAdmin,
    this.isModerator,
    this.relationship,
    this.skipThreadContainment,
    this.tags,
  });

  factory AccountPleroma.fromJson(Map<String, dynamic> json) =>
      _$AccountPleromaFromJson(json);

  factory AccountPleroma.fromJsonString(String jsonString) =>
      _$AccountPleromaFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$AccountPleromaToJson(this);

  String toJsonString() => jsonEncode(_$AccountPleromaToJson(this));
}

@JsonSerializable()
class Source {
  String note;
  Relationship pleroma;
  bool sensitive;

  Source({
    this.note,
    this.pleroma,
    this.sensitive,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  factory Source.fromJsonString(String jsonString) =>
      _$SourceFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  String toJsonString() => jsonEncode(_$SourceToJson(this));
}

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
  Content content;
  @JsonKey(name: "conversation_id")
  int conversationId;
  @JsonKey(name: "in_reply_to_account_acct")
  String inReplyToAccountAcct;
  bool local;
  @JsonKey(name: "spoiler_text")
  Content spoilerText;

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

enum Visibility { PUBLIC, UNLISTED, DIRECT, PRIVATE }

final visibilityValues = new EnumValues({
  "public": Visibility.PUBLIC,
  "unlisted": Visibility.UNLISTED,
  "direct": Visibility.DIRECT,
  "private" : Visibility.PRIVATE
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
