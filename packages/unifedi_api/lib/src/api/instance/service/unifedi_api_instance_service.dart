import '../../access/scopes/unifedi_api_access_scopes_model.dart';
import '../../account/unifedi_api_account_model.dart';
import '../../application/client/unifedi_api_client_application_model.dart';
import '../../captcha/unifedi_api_captcha_model.dart';
import '../../emoji/unifedi_api_emoji_model.dart';
import '../../feature/unifedi_api_feature_model.dart';
import '../../frontend_configurations/unifedi_api_frontend_configurations_model.dart';
import '../../oauth/unifedi_api_oauth_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../tag/unifedi_api_tag_model.dart';
import '../../unifedi_api_service.dart';
import '../activity/item/unifedi_api_instance_activity_item_model.dart';
import '../unifedi_api_instance_model.dart';

abstract class IUnifediApiInstanceService implements IUnifediApiService {
  IUnifediApiAccessScopes calculateAvailableScopes();

  IUnifediApiFeature get getFrontendConfigurationsFeature;

  Future<IUnifediApiFrontendConfigurations> getFrontendConfigurations();

  IUnifediApiFeature get getCustomEmojisFeature;

  Future<List<IUnifediApiEmoji>> getCustomEmojis();

  IUnifediApiFeature get getCaptchaFeature;

  Future<IUnifediApiCaptcha> getCaptcha();

  IUnifediApiFeature get retrieveAppAccessTokenFeature;

  IUnifediApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature;

  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IUnifediApiFeature get retrieveAccountAccessTokenFromRefreshTokenFeature;

  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromRefreshToken({
    required String refreshToken,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IUnifediApiFeature get retrieveAccountAccessTokenFromUserPasswordFeature;

  // ignore: long-parameter-list
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromUserPassword({
    required String user,
    required String password,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IUnifediApiFeature get extractAuthCodeFromCallbackUrlFeature;

  String extractAuthCodeFromCallbackUrl(String url);

  Future<IUnifediApiOAuthToken> retrieveAppAccessToken({
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IUnifediApiFeature get revokeAccessTokenFeature;

  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  });

  IUnifediApiFeature get calculateAuthLoginUrlFeature;

  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
  });

  IUnifediApiFeature get registerAppFeature;

  Future<IUnifediApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
    required String? website,
  });

  IUnifediApiFeature get getInstanceFeature;

  Future<IUnifediApiInstance> getInstance();

  IUnifediApiFeature get getFederatedPeersFeature;

  Future<List<String>> getFederatedPeers();

  IUnifediApiFeature get getActivityFeature;

  Future<List<IUnifediApiInstanceActivityItem>> getActivity();

  IUnifediApiFeature get getDirectoryAccountsFeature;

  Future<List<IUnifediApiAccount>> getDirectoryAccounts({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
  });

  IUnifediApiFeature get getTrendingTagsFeature;

  Future<List<IUnifediApiTag>> getTrendingTags({
    required int? limit,
  });
}
