import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../account/my/unifedi_api_my_account_model_impl.dart';
import '../../../oauth/unifedi_api_oauth_model_impl.dart';
import '../../scopes/unifedi_api_access_scopes_model_impl.dart';
import 'unifedi_api_access_user_token_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_access_user_token_model_impl.freezed.dart';

part 'unifedi_api_access_user_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessUserToken
    with _$UnifediApiAccessUserToken
    implements IUnifediApiAccessUserToken {
  const UnifediApiAccessUserToken._();

  const factory UnifediApiAccessUserToken({
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required UnifediApiOAuthToken oauthToken,
    @HiveField(1) required UnifediApiAccessScopes scopes,
    @HiveField(2) required String user,
    @JsonKey(name: 'my_account')
    @HiveField(4)
        required UnifediApiMyAccount? myAccount,
  }) = _UnifediApiAccessUserToken;

  @override
  String get accessToken => oauthToken.accessToken;

  factory UnifediApiAccessUserToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessUserTokenFromJson(json);
}

extension IUnifediApiAccessUserTokenInterfaceExtension
    on IUnifediApiAccessUserToken {
  UnifediApiAccessUserToken toUnifediApiAccessUserToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccessUserToken(
          oauthToken: oauthToken.toUnifediApiOAuthToken(),
          user: user,
          myAccount: myAccount?.toUnifediApiMyAccount(),
          scopes:
              scopes.toUnifediApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
