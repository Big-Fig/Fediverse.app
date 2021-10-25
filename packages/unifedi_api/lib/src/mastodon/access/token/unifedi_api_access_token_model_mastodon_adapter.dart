import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../api/access/token/unifedi_api_access_token_model.dart';
import '../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../oauth/unifedi_api_oauth_model_mastodon_adapter.dart';
import '../scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';

part 'unifedi_api_access_token_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_token_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessTokenMastodonAdapter
    with _$UnifediApiAccessTokenMastodonAdapter
    implements IUnifediApiAccessToken {
  const UnifediApiAccessTokenMastodonAdapter._();

  const factory UnifediApiAccessTokenMastodonAdapter(
    @HiveField(0) MastodonApiAccessToken value,
  ) = _UnifediApiAccessTokenMastodonAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenMastodonAdapter();

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesMastodonAdapter();

  factory UnifediApiAccessTokenMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessTokenMastodonAdapterFromJson(json);
}

extension MastodonApiAccessTokenUnifediExtension on IMastodonApiAccessToken {
  UnifediApiAccessTokenMastodonAdapter
      toUnifediApiAccessTokenMastodonAdapter() =>
          UnifediApiAccessTokenMastodonAdapter(
            toMastodonApiAccessToken(),
          );
}

extension UnifediApiAccessTokenMastodonExtension on IUnifediApiAccessToken {
  MastodonApiAccessToken toMastodonApiAccessToken() => MastodonApiAccessToken(
        oauthToken: oauthToken.toMastodonApiOAuthToken(),
        scopes: scopes.toMastodonApiAccessScopes(),
      );
}
