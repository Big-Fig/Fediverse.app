import 'dart:convert';

import 'package:fedi/mastodon/poll/mastodon_poll_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_poll_model.g.dart';

abstract class IPleromaPoll implements IMastodonPoll {
  @override
  List<IPleromaPollOption> get options;
}

abstract class IPleromaPollOption implements IMastodonPollOption {}

@JsonSerializable()
class PleromaPollOption implements IPleromaPollOption {
  @override
  String title;

  @override
  @JsonKey(name: "votes_count")
  int votesCount;

  PleromaPollOption({this.title, this.votesCount});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPollOption &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          votesCount == other.votesCount;

  @override
  int get hashCode => title.hashCode ^ votesCount.hashCode;

  factory PleromaPollOption.fromJson(Map<String, dynamic> json) =>
      _$PleromaPollOptionFromJson(json);

  factory PleromaPollOption.fromJsonString(String jsonString) =>
      _$PleromaPollOptionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPollOptionToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPollOptionToJson(this));

  @override
  String toString() {
    return 'PleromaPollOption{title: $title, votesCount: $votesCount}';
  }
}

@JsonSerializable()
class PleromaPoll implements IPleromaPoll {
  @override
  final bool expired;

  @override
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  @override
  final String id;

  @override
  final bool multiple;

  @override
  final List<PleromaPollOption> options;

  @override
  @JsonKey(name: "own_votes")
  final List<int> ownVotes;

  @override
  final bool voted;

  @override
  @JsonKey(name: "voters_count")
  final int votersCount;

  @override
  @JsonKey(name: "votes_count")
  final int votesCount;

  PleromaPoll(
      {this.expired,
      this.expiresAt,
      this.id,
      this.multiple,
      this.options,
      this.ownVotes,
      this.voted,
      this.votersCount,
      this.votesCount});

  factory PleromaPoll.fromJson(Map<String, dynamic> json) =>
      _$PleromaPollFromJson(json);

  factory PleromaPoll.fromJsonString(String jsonString) =>
      _$PleromaPollFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPollToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPollToJson(this));


  @override
  String toString() {
    return 'PleromaPoll{expired: $expired, expiresAt: $expiresAt,'
        ' id: $id, multiple: $multiple, options: $options,'
        ' ownVotes: $ownVotes, voted: $voted,'
        ' votersCount: $votersCount, votesCount: $votesCount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPoll &&
          runtimeType == other.runtimeType &&
          expired == other.expired &&
          expiresAt == other.expiresAt &&
          id == other.id &&
          multiple == other.multiple &&
          options == other.options &&
          ownVotes == other.ownVotes &&
          voted == other.voted &&
          votersCount == other.votersCount &&
          votesCount == other.votesCount;

  @override
  int get hashCode =>
      expired.hashCode ^
      expiresAt.hashCode ^
      id.hashCode ^
      multiple.hashCode ^
      options.hashCode ^
      ownVotes.hashCode ^
      voted.hashCode ^
      votersCount.hashCode ^
      votesCount.hashCode;
}
