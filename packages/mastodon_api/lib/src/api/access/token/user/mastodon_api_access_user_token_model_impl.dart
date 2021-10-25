import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../account/my/mastodon_api_my_account_model_impl.dart';
import '../../../oauth/mastodon_api_oauth_model_impl.dart';
import '../../scopes/mastodon_api_access_scopes_model_impl.dart';
import 'mastodon_api_access_user_token_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_access_user_token_model_impl.freezed.dart';

part 'mastodon_api_access_user_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccessUserToken
    with _$MastodonApiAccessUserToken
    implements IMastodonApiAccessUserToken {
  const MastodonApiAccessUserToken._();

  const factory MastodonApiAccessUserToken({
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required MastodonApiOAuthToken oauthToken,
    @HiveField(1) required MastodonApiAccessScopes scopes,
    @HiveField(2) required String user,
    @JsonKey(name: 'my_account')
    @HiveField(4)
        required MastodonApiMyAccount? myAccount,
  }) = _MastodonApiAccessUserToken;

  @override
  String get accessToken => oauthToken.accessToken;

  factory MastodonApiAccessUserToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessUserTokenFromJson(json);
}

extension IMastodonApiAccessUserTokenInterfaceExtension
    on IMastodonApiAccessUserToken {
  MastodonApiAccessUserToken toMastodonApiAccessUserToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccessUserToken(
          oauthToken: oauthToken.toMastodonApiOAuthToken(),
          user: user,
          myAccount: myAccount?.toMastodonApiMyAccount(),
          scopes:
              scopes.toMastodonApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
