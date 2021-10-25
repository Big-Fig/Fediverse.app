import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../oauth/mastodon_api_oauth_model_impl.dart';
import '../scopes/mastodon_api_access_scopes_model_impl.dart';
import 'mastodon_api_access_token_model.dart';

part 'mastodon_api_access_token_model_impl.freezed.dart';

part 'mastodon_api_access_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessToken
    with _$MastodonApiAccessToken
    implements IMastodonApiAccessToken {
  const MastodonApiAccessToken._();

  const factory MastodonApiAccessToken({
    @HiveField(0)
    @JsonKey(name: 'oauth_token')
        required MastodonApiOAuthToken oauthToken,
    @HiveField(1) required MastodonApiAccessScopes scopes,
  }) = _MastodonApiAccessToken;

  factory MastodonApiAccessToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IMastodonApiAccessTokenInterfaceExtension on IMastodonApiAccessToken {
  MastodonApiAccessToken toMastodonApiAccessToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessToken(
          oauthToken: oauthToken.toMastodonApiOAuthToken(),
          scopes:
              scopes.toMastodonApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
