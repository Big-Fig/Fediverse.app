import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_oauth_model.dart';

part 'mastodon_api_oauth_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_oauth_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiOAuthToken
    with _$MastodonApiOAuthToken
    implements IMastodonApiOAuthToken {
  const factory MastodonApiOAuthToken({
    @HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
    @HiveField(1) @JsonKey(name: 'token_type') required String tokenType,
  }) = _MastodonApiOAuthToken;

  factory MastodonApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiOAuthTokenFromJson(json);
}

extension MastodonApiOAuthTokenInterfaceExtension on IMastodonApiOAuthToken {
  MastodonApiOAuthToken toMastodonApiOAuthToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiOAuthToken(
          accessToken: accessToken,
          tokenType: tokenType,
        ),
        forceNewObject: forceNewObject,
      );
}
