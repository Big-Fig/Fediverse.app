import 'dart:convert';

import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_instance_model.g.dart';

abstract class IMastodonInstanceHistory {
  String get week;

  String get statuses;

  String get logins;

  String get registrations;
}

abstract class IMastodonInstance {
  String get uri;

  String get title;

  String get shortDescription;

  String get description;

  String get email;

  String get version;

  MastodonUrls get urls;

  MastodonInstanceStats get stats;

  String get thumbnail;

  List<String> get languages;

  bool get registrations;

  bool get approvalRequired;

  bool get invitesEnabled;

  IMastodonAccount get contactAccount;
}

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 61)
class MastodonInstanceStats {
  @JsonKey(name: "user_count")
  @HiveField(0)
  final int userCount;
  @JsonKey(name: "status_count")
  @HiveField(1)
  final int statusCount;
  @JsonKey(name: "domain_count")
  @HiveField(2)
  final int domainCount;

  MastodonInstanceStats({this.userCount, this.statusCount, this.domainCount});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonInstanceStats &&
          runtimeType == other.runtimeType &&
          userCount == other.userCount &&
          statusCount == other.statusCount &&
          domainCount == other.domainCount;

  @override
  int get hashCode =>
      userCount.hashCode ^ statusCount.hashCode ^ domainCount.hashCode;

  @override
  String toString() {
    return 'MastodonInstanceStats{userCount: $userCount,'
        ' statusCount: $statusCount, domainCount: $domainCount}';
  }

  factory MastodonInstanceStats.fromJson(Map<String, dynamic> json) =>
      _$MastodonInstanceStatsFromJson(json);

  factory MastodonInstanceStats.fromJsonString(String jsonString) =>
      _$MastodonInstanceStatsFromJson(jsonDecode(jsonString));

  static List<MastodonInstanceStats> listFromJsonString(String str) =>
      List<MastodonInstanceStats>.from(
          json.decode(str).map((x) => MastodonInstanceStats.fromJson(x)));

  Map<String, dynamic> toJson() => _$MastodonInstanceStatsToJson(this);

  String toJsonString() => jsonEncode(_$MastodonInstanceStatsToJson(this));
}

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 62)
class MastodonUrls {
  @JsonKey(name: "streaming_api")
  @HiveField(0)
  final String streamingApi;

  MastodonUrls({this.streamingApi});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonUrls &&
          runtimeType == other.runtimeType &&
          streamingApi == other.streamingApi;

  @override
  int get hashCode => streamingApi.hashCode;

  @override
  String toString() {
    return 'MastodonUrls{streamingApi: $streamingApi}';
  }

  factory MastodonUrls.fromJson(Map<String, dynamic> json) =>
      _$MastodonUrlsFromJson(json);

  factory MastodonUrls.fromJsonString(String jsonString) =>
      _$MastodonUrlsFromJson(jsonDecode(jsonString));

  static List<MastodonUrls> listFromJsonString(String str) =>
      List<MastodonUrls>.from(
          json.decode(str).map((x) => MastodonUrls.fromJson(x)));

  Map<String, dynamic> toJson() => _$MastodonUrlsToJson(this);

  String toJsonString() => jsonEncode(_$MastodonUrlsToJson(this));
}
