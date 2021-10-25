import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/access/token/application/unifedi_api_access_application_token_model.dart';
import '../../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../application/client/unifedi_api_client_application_model_mastodon_adapter.dart';
import '../../../oauth/unifedi_api_oauth_model_mastodon_adapter.dart';
import '../../scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';

part 'unifedi_api_access_application_token_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_application_token_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessApplicationTokenMastodonAdapter
    with _$UnifediApiAccessApplicationTokenMastodonAdapter
    implements IUnifediApiAccessApplicationToken {
  const UnifediApiAccessApplicationTokenMastodonAdapter._();

  const factory UnifediApiAccessApplicationTokenMastodonAdapter(
    @HiveField(0) MastodonApiAccessApplicationToken value,
  ) = _UnifediApiAccessApplicationTokenMastodonAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesMastodonAdapter();

  @override
  IUnifediApiClientApplication get clientApplication =>
      value.clientApplication.toUnifediApiClientApplicationMastodonAdapter();

  factory UnifediApiAccessApplicationTokenMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessApplicationTokenMastodonAdapterFromJson(json);

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenMastodonAdapter();
}

extension MastodonApiAccessApplicationTokenUnifediExtension
    on IMastodonApiAccessApplicationToken {
  UnifediApiAccessApplicationTokenMastodonAdapter
      toUnifediApiAccessApplicationTokenMastodonAdapter() =>
          UnifediApiAccessApplicationTokenMastodonAdapter(
            toMastodonApiAccessApplicationToken(),
          );
}

extension UnifediApiAccessApplicationTokenMastodonExtension
    on IUnifediApiAccessApplicationToken {
  MastodonApiAccessApplicationToken toMastodonApiAccessApplicationToken() =>
      MastodonApiAccessApplicationToken(
        clientApplication: clientApplication.toMastodonApiClientApplication(),
        oauthToken: oauthToken.toMastodonApiOAuthToken(),
        scopes: scopes.toMastodonApiAccessScopes(),
      );
}
