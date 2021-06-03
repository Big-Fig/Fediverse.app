import 'package:fedi/json/json_model.dart';
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
class MastodonApiInstanceStats implements IJsonObject {
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
    required this.userCount,
    required this.statusCount,
    required this.domainCount,
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
    return 'MastodonApiInstanceStats{'
        'userCount: $userCount, '
        'statusCount: $statusCount,'
        'domainCount: $domainCount'
        '}';
  }

  static MastodonApiInstanceStats fromJson(Map<String, dynamic> json) =>
      _$MastodonApiInstanceStatsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MastodonApiInstanceStatsToJson(this);
}

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 62)
class MastodonApiUrls implements IJsonObject {
  @JsonKey(name: "streaming_api")
  @HiveField(0)
  final String? streamingApi;

  MastodonApiUrls({
    required this.streamingApi,
  });

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

  static MastodonApiUrls fromJson(Map<String, dynamic> json) =>
      _$MastodonApiUrlsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MastodonApiUrlsToJson(this);
}
