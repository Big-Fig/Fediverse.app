import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../oauth/unifedi_api_oauth_model_impl.dart';
import '../scopes/unifedi_api_access_scopes_model_impl.dart';
import 'unifedi_api_access_token_model.dart';

part 'unifedi_api_access_token_model_impl.freezed.dart';

part 'unifedi_api_access_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessToken
    with _$UnifediApiAccessToken
    implements IUnifediApiAccessToken {
  const UnifediApiAccessToken._();

  const factory UnifediApiAccessToken({
    @HiveField(0)
    @JsonKey(name: 'oauth_token')
        required UnifediApiOAuthToken oauthToken,
    @HiveField(1) required UnifediApiAccessScopes scopes,
  }) = _UnifediApiAccessToken;

  factory UnifediApiAccessToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IUnifediApiAccessTokenInterfaceExtension on IUnifediApiAccessToken {
  UnifediApiAccessToken toUnifediApiAccessToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessToken(
          oauthToken: oauthToken.toUnifediApiOAuthToken(),
          scopes:
              scopes.toUnifediApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
