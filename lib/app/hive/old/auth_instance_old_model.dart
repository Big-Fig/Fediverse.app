import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';

part 'auth_instance_old_model.freezed.dart';

part 'auth_instance_old_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
// ignore_for_file: no-magic-number
@HiveType(typeId: -32 + 50)
@freezed
class AuthInstanceOld with _$AuthInstanceOld implements IJsonObj {
  bool get isSupportChats =>
      info?.pleroma?.metadata?.features?.contains('pleroma_chat_messages') ==
      true;

  String get userAtHost => '$acct@$urlHost';

  bool get isMastodon => !isPleroma;

  bool get isSupportFeaturedTags => isMastodon;

  Uri get uri => Uri(scheme: urlSchema, host: urlHost);

  const AuthInstanceOld._();

  const factory AuthInstanceOld({
    @HiveField(0) @JsonKey(name: 'url_schema') required String? urlSchema,
    @HiveField(1) @JsonKey(name: 'url_host') required String urlHost,
    @HiveField(2) required String acct,
    @HiveField(3) required PleromaApiOAuthToken? token,
    @HiveField(4) @JsonKey(name: 'auth_code') required String? authCode,
    @HiveField(5) @JsonKey(name: 'is_pleroma_instance') required bool isPleroma,
    @HiveField(6) required PleromaApiClientApplication? application,
    @HiveField(7) required PleromaApiInstance? info,
  }) = _AuthInstanceOld;

  bool? get isSubscribeToAccountFeatureSupported => isPleroma;

  bool? get isAccountFavouritesFeatureSupported => isPleroma;

  bool get isFeaturedTagsSupported => isMastodon;

  bool get isEndorsementSupported => isMastodon;

  bool get isSuggestionSupported => isMastodon;

  bool isInstanceWithHostAndAcct({
    required String? host,
    required String? acct,
  }) =>
      this.acct == acct && urlHost == host;

  factory AuthInstanceOld.fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceOldFromJson(json);
}
