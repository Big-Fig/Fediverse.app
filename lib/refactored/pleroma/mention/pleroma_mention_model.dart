import 'dart:convert';

import 'package:fedi/refactored/mastodon/mention/mastodon_mention_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_mention_model.g.dart';

abstract class IPleromaMention implements IMastodonMention {}

@JsonSerializable()
class PleromaMention implements IPleromaMention {
  @override
  final String acct;
  @override
  final String id;
  @override
  final String url;
  @override
  final String username;

  PleromaMention({
    this.acct,
    this.id,
    this.url,
    this.username,
  });

  factory PleromaMention.fromJson(Map<String, dynamic> json) =>
      _$PleromaMentionFromJson(json);

  factory PleromaMention.fromJsonString(String jsonString) =>
      _$PleromaMentionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaMentionToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMentionToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMention &&
          runtimeType == other.runtimeType &&
          acct == other.acct &&
          id == other.id &&
          url == other.url &&
          username == other.username;

  @override
  int get hashCode =>
      acct.hashCode ^ id.hashCode ^ url.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'PleromaMention{acct: $acct, id: $id,'
        ' url: $url, username: $username}';
  }
}
