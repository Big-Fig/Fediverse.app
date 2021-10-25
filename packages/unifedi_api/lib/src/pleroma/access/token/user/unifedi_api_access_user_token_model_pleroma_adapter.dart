import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/access/token/user/unifedi_api_access_user_token_model.dart';
import '../../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../account/my/unifedi_api_my_account_model_pleroma_adapter.dart';
import '../../../oauth/unifedi_api_oauth_model_pleroma_adapter.dart';
import '../../scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';

part 'unifedi_api_access_user_token_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_user_token_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessUserTokenPleromaAdapter
    with _$UnifediApiAccessUserTokenPleromaAdapter
    implements IUnifediApiAccessUserToken {
  const UnifediApiAccessUserTokenPleromaAdapter._();

  const factory UnifediApiAccessUserTokenPleromaAdapter(
    @HiveField(0) PleromaApiAccessUserToken value,
  ) = _UnifediApiAccessUserTokenPleromaAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenPleromaAdapter();

  @override
  String get user => value.user;

  @override
  IUnifediApiMyAccount? get myAccount =>
      value.myAccount?.toUnifediApiMyAccountPleromaAdapter();

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesPleromaAdapter();

  factory UnifediApiAccessUserTokenPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessUserTokenPleromaAdapterFromJson(json);
}

extension PleromaApiAccessUserTokenUnifediExtension
    on IPleromaApiAccessUserToken {
  UnifediApiAccessUserTokenPleromaAdapter
      toUnifediApiAccessUserTokenPleromaAdapter() =>
          UnifediApiAccessUserTokenPleromaAdapter(
            toPleromaApiAccessUserToken(),
          );
}

extension UnifediApiAccessUserTokenPleromaExtension
    on IUnifediApiAccessUserToken {
  PleromaApiAccessUserToken toPleromaApiAccessUserToken() =>
      PleromaApiAccessUserToken(
        oauthToken: oauthToken.toPleromaApiOAuthToken(),
        scopes: scopes.toPleromaApiAccessScopes(),
        user: user,
        myAccount: myAccount?.toPleromaApiMyAccount(),
      );
}
