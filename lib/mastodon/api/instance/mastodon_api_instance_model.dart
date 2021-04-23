import 'dart:convert';

import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_instance_model.g.dart';

abstract class IMastodonApiInstanceHistory {
  String? get week;

  String? get statuses;

  String? get logins;

  String? get registrations;
}

abstract class IMastodonApiInstance {
  String? get uri;

  String? get title;

  String? get shortDescription;

  String? get description;

  String? get email;

  String? get version;

  MastodonApiUrls? get urls;

  MastodonApiInstanceStats? get stats;

  String? get thumbnail;

  List<String>? get languages;

  bool? get registrations;

  bool? get approvalRequired;

  bool? get invitesEnabled;

  IMastodonApiAccount? get contactAccount;
}

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 61)
class MastodonApiInstanceStats {
  @JsonKey(name: "user_count")
  @HiveField(0)
  final int? userCount;
  @JsonKey(name: "status_count")
  @HiveField(1)
  final int? statusCount;
  @JsonKey(name: "domain_count")
  @HiveField(2)
  final int? domainCount;

  MastodonApiInstanceStats({
    this.userCount,
    this.statusCount,
    this.domainCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiInstanceStats &&
          runtimeType == other.runtimeType &&
          userCount == other.userCount &&
          statusCount == other.statusCount &&
          domainCount == other.domainCount;

  @override
  int get hashCode =>
      userCount.hashCode ^ statusCount.hashCode ^ domainCount.hashCode;

  @override
  String toString() {
    return 'MastodonApiInstanceStats{userCount: $userCount,'
        ' statusCount: $statusCount, domainCount: $domainCount}';
  }

  factory MastodonApiInstanceStats.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiInstanceStatsFromJson(json);

  factory MastodonApiInstanceStats.fromJsonString(String jsonString) =>
      _$MastodonApiInstanceStatsFromJson(jsonDecode(jsonString));

  static List<MastodonApiInstanceStats> listFromJsonString(String str) =>
      List<MastodonApiInstanceStats>.from(
        json.decode(str).map((x) => MastodonApiInstanceStats.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$MastodonApiInstanceStatsToJson(this);

  String toJsonString() => jsonEncode(_$MastodonApiInstanceStatsToJson(this));
}

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 62)
class MastodonApiUrls {
  @JsonKey(name: "streaming_api")
  @HiveField(0)
  final String? streamingApi;

  MastodonApiUrls({this.streamingApi});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiUrls &&
          runtimeType == other.runtimeType &&
          streamingApi == other.streamingApi;

  @override
  int get hashCode => streamingApi.hashCode;

  @override
  String toString() {
    return 'MastodonApiUrls{streamingApi: $streamingApi}';
  }

  factory MastodonApiUrls.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiUrlsFromJson(json);

  factory MastodonApiUrls.fromJsonString(String jsonString) =>
      _$MastodonApiUrlsFromJson(jsonDecode(jsonString));

  static List<MastodonApiUrls> listFromJsonString(String str) =>
      List<MastodonApiUrls>.from(
        json.decode(str).map((x) => MastodonApiUrls.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$MastodonApiUrlsToJson(this);

  String toJsonString() => jsonEncode(_$MastodonApiUrlsToJson(this));
}
