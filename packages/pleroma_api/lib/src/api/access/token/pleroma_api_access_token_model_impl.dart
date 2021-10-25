import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../oauth/pleroma_api_oauth_model_impl.dart';
import '../scopes/pleroma_api_access_scopes_model_impl.dart';
import 'pleroma_api_access_token_model.dart';

part 'pleroma_api_access_token_model_impl.freezed.dart';

part 'pleroma_api_access_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessToken
    with _$PleromaApiAccessToken
    implements IPleromaApiAccessToken {
  const PleromaApiAccessToken._();

  const factory PleromaApiAccessToken({
    @HiveField(0)
    @JsonKey(name: 'oauth_token')
        required PleromaApiOAuthToken oauthToken,
    @HiveField(1) required PleromaApiAccessScopes scopes,
  }) = _PleromaApiAccessToken;

  factory PleromaApiAccessToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessTokenFromJson(json);

  @override
  String get accessToken => oauthToken.accessToken;
}

extension IPleromaApiAccessTokenInterfaceExtension on IPleromaApiAccessToken {
  PleromaApiAccessToken toPleromaApiAccessToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessToken(
          oauthToken: oauthToken.toPleromaApiOAuthToken(),
          scopes:
              scopes.toPleromaApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
