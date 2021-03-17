import 'dart:convert';

import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/mastodon/mention/mastodon_mention_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_mention_model.g.dart';

abstract class IPleromaMention implements IMastodonMention {}

extension IPleromaMentionStatusListExtension on List<IStatus> {
  List<IPleromaMention> findAllMentions() {
    List<IStatus> statuses = this;
    Set<IPleromaMention> mentions = {};

    statuses.forEach(
      (status) {
        mentions.addAll(status.mentions ?? []);
      },
    );

    return mentions.toList();
  }
}

extension IPleromaMentionExtension on IPleromaMention {
  PleromaMention toPleromaMention() {
    if (this is PleromaMention) {
      return this as PleromaMention;
    } else {
      return PleromaMention(
        acct: acct,
        id: id,
        url: url,
        username: username,
      );
    }
  }
}

extension IPleromaMentionListExtension on List<IPleromaMention> {
  List<PleromaMention> toPleromaMentions() {
    if (this is List<PleromaMention>) {
      return this as List<PleromaMention>;
    } else {
      return map(
        (pleromaMention) => pleromaMention.toPleromaMention(),
      ).toList();
    }
  }

  List<String> toAccts() {
    return map(
      (pleromaMention) => pleromaMention.acct,
    ).toList();
  }
}

@JsonSerializable()
class PleromaMention implements IPleromaMention {
  @override
  final String acct;
  @override
  final String id;
  @override
  final String url;
  @override
  final String? username;

  PleromaMention({
    required this.acct,
    required this.id,
    required this.url,
    required this.username,
  });

  PleromaMention.only({
    required this.acct,
    required this.id,
    required this.url,
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
    return 'PleromaMention{'
        'acct: $acct, '
        'id: $id, '
        'url: $url, '
        'username: $username'
        '}';
  }
}
