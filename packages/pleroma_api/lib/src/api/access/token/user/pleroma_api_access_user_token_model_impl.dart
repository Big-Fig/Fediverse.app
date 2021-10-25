import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../account/my/pleroma_api_my_account_model_impl.dart';
import '../../../oauth/pleroma_api_oauth_model_impl.dart';
import '../../scopes/pleroma_api_access_scopes_model_impl.dart';
import 'pleroma_api_access_user_token_model.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_access_user_token_model_impl.freezed.dart';

part 'pleroma_api_access_user_token_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccessUserToken
    with _$PleromaApiAccessUserToken
    implements IPleromaApiAccessUserToken {
  const PleromaApiAccessUserToken._();

  const factory PleromaApiAccessUserToken({
    @HiveField(3)
    @JsonKey(name: 'oauth_token')
        required PleromaApiOAuthToken oauthToken,
    @HiveField(1) required PleromaApiAccessScopes scopes,
    @HiveField(2) required String user,
    @JsonKey(name: 'my_account')
    @HiveField(4)
        required PleromaApiMyAccount? myAccount,
  }) = _PleromaApiAccessUserToken;

  @override
  String get accessToken => oauthToken.accessToken;

  factory PleromaApiAccessUserToken.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessUserTokenFromJson(json);
}

extension IPleromaApiAccessUserTokenInterfaceExtension
    on IPleromaApiAccessUserToken {
  PleromaApiAccessUserToken toPleromaApiAccessUserToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccessUserToken(
          myAccount: myAccount?.toPleromaApiMyAccount(),
          oauthToken: oauthToken.toPleromaApiOAuthToken(),
          user: user,
          scopes:
              scopes.toPleromaApiAccessScopes(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
