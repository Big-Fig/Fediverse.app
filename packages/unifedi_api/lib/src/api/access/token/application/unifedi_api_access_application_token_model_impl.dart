import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../application/client/unifedi_api_client_application_model_impl.dart';
import '../../../oauth/unifedi_api_oauth_model_impl.dart';
import '../../scopes/unifedi_api_access_scopes_model_impl.dart';
import 'unifedi_api_access_application_token_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_access_application_token_model_impl.freezed.dart';

part 'unifedi_api_access_application_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessApplicationToken
    with _$UnifediApiAccessApplicationToken
    implements IUnifediApiAccessApplicationToken {
  const UnifediApiAccessApplicationToken._();

  const factory UnifediApiAccessApplicationToken({
    @HiveField(1) required UnifediApiAccessScopes scopes,
    @HiveField(2) required UnifediApiClientApplication clientApplication,
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required UnifediApiOAuthToken oauthToken,
  }) = _UnifediApiAccessApplicationToken;

  factory UnifediApiAccessApplicationToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessApplicationTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IUnifediApiAccessApplicationTokenInterfaceExtension
    on IUnifediApiAccessApplicationToken {
  UnifediApiAccessApplicationToken toUnifediApiAccessApplicationToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessApplicationToken(
          scopes: scopes.toUnifediApiAccessScopes(
            forceNewObject: forceNewObject,
          ),
          clientApplication: clientApplication.toUnifediApiClientApplication(
            forceNewObject: forceNewObject,
          ),
          oauthToken: oauthToken.toUnifediApiOAuthToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
