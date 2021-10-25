import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../api/access/token/unifedi_api_access_token_model.dart';
import '../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../oauth/unifedi_api_oauth_model_pleroma_adapter.dart';
import '../scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';

part 'unifedi_api_access_token_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_token_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessTokenPleromaAdapter
    with _$UnifediApiAccessTokenPleromaAdapter
    implements IUnifediApiAccessToken {
  const UnifediApiAccessTokenPleromaAdapter._();

  const factory UnifediApiAccessTokenPleromaAdapter(
    @HiveField(0) PleromaApiAccessToken value,
  ) = _UnifediApiAccessTokenPleromaAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenPleromaAdapter();

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesPleromaAdapter();

  factory UnifediApiAccessTokenPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessTokenPleromaAdapterFromJson(json);
}

extension PleromaApiAccessTokenUnifediExtension on IPleromaApiAccessToken {
  UnifediApiAccessTokenPleromaAdapter toUnifediApiAccessTokenPleromaAdapter() =>
      UnifediApiAccessTokenPleromaAdapter(
        toPleromaApiAccessToken(),
      );
}

extension UnifediApiAccessTokenPleromaExtension on IUnifediApiAccessToken {
  PleromaApiAccessToken toPleromaApiAccessToken() => PleromaApiAccessToken(
        oauthToken: oauthToken.toPleromaApiOAuthToken(),
        scopes: scopes.toPleromaApiAccessScopes(),
      );
}
