import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../application/client/mastodon_api_client_application_model_impl.dart';
import '../../../oauth/mastodon_api_oauth_model_impl.dart';
import '../../scopes/mastodon_api_access_scopes_model_impl.dart';
import 'mastodon_api_access_application_token_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_access_application_token_model_impl.freezed.dart';

part 'mastodon_api_access_application_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessApplicationToken
    with _$MastodonApiAccessApplicationToken
    implements IMastodonApiAccessApplicationToken {
  const MastodonApiAccessApplicationToken._();

  const factory MastodonApiAccessApplicationToken({
    @HiveField(1) required MastodonApiAccessScopes scopes,
    @HiveField(2) required MastodonApiClientApplication clientApplication,
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required MastodonApiOAuthToken oauthToken,
  }) = _MastodonApiAccessApplicationToken;

  factory MastodonApiAccessApplicationToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessApplicationTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IMastodonApiAccessApplicationTokenInterfaceExtension
    on IMastodonApiAccessApplicationToken {
  MastodonApiAccessApplicationToken toMastodonApiAccessApplicationToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessApplicationToken(
          scopes: scopes.toMastodonApiAccessScopes(
            forceNewObject: forceNewObject,
          ),
          clientApplication: clientApplication.toMastodonApiClientApplication(
            forceNewObject: forceNewObject,
          ),
          oauthToken: oauthToken.toMastodonApiOAuthToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
