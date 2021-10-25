import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../../api/access/token/application/unifedi_api_access_application_token_model.dart';
import '../../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../application/client/unifedi_api_client_application_model_pleroma_adapter.dart';
import '../../../oauth/unifedi_api_oauth_model_pleroma_adapter.dart';
import '../../scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';

part 'unifedi_api_access_application_token_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_application_token_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessApplicationTokenPleromaAdapter
    with _$UnifediApiAccessApplicationTokenPleromaAdapter
    implements IUnifediApiAccessApplicationToken {
  const UnifediApiAccessApplicationTokenPleromaAdapter._();

  const factory UnifediApiAccessApplicationTokenPleromaAdapter(
    @HiveField(0) PleromaApiAccessApplicationToken value,
  ) = _UnifediApiAccessApplicationTokenPleromaAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  IUnifediApiOAuthToken get oauthToken =>
      value.oauthToken.toUnifediApiOAuthTokenPleromaAdapter();

  @override
  IUnifediApiClientApplication get clientApplication =>
      value.clientApplication.toUnifediApiClientApplicationPleromaAdapter();

  @override
  IUnifediApiAccessScopes get scopes =>
      value.scopes.toUnifediApiAccessScopesPleromaAdapter();

  factory UnifediApiAccessApplicationTokenPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessApplicationTokenPleromaAdapterFromJson(json);
}

extension PleromaApiAccessApplicationTokenUnifediExtension
    on IPleromaApiAccessApplicationToken {
  UnifediApiAccessApplicationTokenPleromaAdapter
      toUnifediApiAccessApplicationTokenPleromaAdapter() =>
          UnifediApiAccessApplicationTokenPleromaAdapter(
            toPleromaApiAccessApplicationToken(),
          );
}

extension UnifediApiAccessApplicationTokenPleromaExtension
    on IUnifediApiAccessApplicationToken {
  PleromaApiAccessApplicationToken toPleromaApiAccessApplicationToken() =>
      PleromaApiAccessApplicationToken(
        clientApplication: clientApplication.toPleromaApiClientApplication(),
        oauthToken: oauthToken.toPleromaApiOAuthToken(),
        scopes: scopes.toPleromaApiAccessScopes(),
      );
}
