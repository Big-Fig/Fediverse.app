import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/access/token/user/unifedi_api_access_user_token_model.dart';
import '../../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../account/my/unifedi_api_my_account_model_mastodon_adapter.dart';
import '../../../oauth/unifedi_api_oauth_model_mastodon_adapter.dart';
import '../../scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';

part 'unifedi_api_access_user_token_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_user_token_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessUserTokenMastodonAdapter
    with _$UnifediApiAccessUserTokenMastodonAdapter
    implements IUnifediApiAccessUserToken {
  const UnifediApiAccessUserTokenMastodonAdapter._();

  const factory UnifediApiAccessUserTokenMastodonAdapter(
    @HiveField(0) MastodonApiAccessUserToken value,
  ) = _UnifediApiAccessUserTokenMastodonAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenMastodonAdapter();

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesMastodonAdapter();

  factory UnifediApiAccessUserTokenMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessUserTokenMastodonAdapterFromJson(json);

  @override
  String get user => value.user;

  @override
  IUnifediApiMyAccount? get myAccount =>
      value.myAccount?.toUnifediApiMyAccountMastodonAdapter();
}

extension MastodonApiAccessUserTokenUnifediExtension
    on IMastodonApiAccessUserToken {
  UnifediApiAccessUserTokenMastodonAdapter
      toUnifediApiAccessUserTokenMastodonAdapter() =>
          UnifediApiAccessUserTokenMastodonAdapter(
            toMastodonApiAccessUserToken(),
          );
}

extension UnifediApiAccessUserTokenMastodonExtension
    on IUnifediApiAccessUserToken {
  MastodonApiAccessUserToken toMastodonApiAccessUserToken() =>
      MastodonApiAccessUserToken(
        oauthToken: oauthToken.toMastodonApiOAuthToken(),
        scopes: scopes.toMastodonApiAccessScopes(),
        user: user,
        myAccount: myAccount?.toMastodonApiMyAccount(),
      );
}
