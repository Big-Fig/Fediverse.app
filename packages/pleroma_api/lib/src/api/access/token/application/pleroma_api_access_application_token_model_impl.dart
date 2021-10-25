import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../application/client/pleroma_api_client_application_model_impl.dart';
import '../../../oauth/pleroma_api_oauth_model_impl.dart';
import '../../scopes/pleroma_api_access_scopes_model_impl.dart';
import 'pleroma_api_access_application_token_model.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_access_application_token_model_impl.freezed.dart';

part 'pleroma_api_access_application_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessApplicationToken
    with _$PleromaApiAccessApplicationToken
    implements IPleromaApiAccessApplicationToken {
  const PleromaApiAccessApplicationToken._();

  const factory PleromaApiAccessApplicationToken({
    @HiveField(1) required PleromaApiAccessScopes scopes,
    @HiveField(2) required PleromaApiClientApplication clientApplication,
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required PleromaApiOAuthToken oauthToken,
  }) = _PleromaApiAccessApplicationToken;

  factory PleromaApiAccessApplicationToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessApplicationTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IPleromaApiAccessApplicationTokenInterfaceExtension
    on IPleromaApiAccessApplicationToken {
  PleromaApiAccessApplicationToken toPleromaApiAccessApplicationToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessApplicationToken(
          scopes: scopes.toPleromaApiAccessScopes(
            forceNewObject: forceNewObject,
          ),
          clientApplication: clientApplication.toPleromaApiClientApplication(
            forceNewObject: forceNewObject,
          ),
          oauthToken: oauthToken.toPleromaApiOAuthToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
