import 'dart:convert';

import 'package:fedi/mastodon/mention/mastodon_mention_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_mention_model.g.dart';

abstract class IPleromaMention implements IMastodonMention {
  
}

@JsonSerializable()
class PleromaMention implements IPleromaMention {
  final String acct;
  final String id;
  final String url;
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
}