import '../../../../access/scopes/pleroma_api_access_scopes_model.dart';
import '../../../../account/pleroma_api_account_model.dart';
import '../../../../application/client/pleroma_api_client_application_model.dart';
import '../../../../captcha/pleroma_api_captcha_model.dart';
import '../../../../emoji/custom/pleroma_api_custom_emoji_model.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../frontend_configurations/pleroma_api_frontend_configurations_model.dart';
import '../../../../oauth/pleroma_api_oauth_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../tag/pleroma_api_tag_model.dart';
import '../../../activity/item/pleroma_api_instance_activity_item_model.dart';
import '../../../pleroma_api_instance_model.dart';

abstract class IPleromaApiInstancePublicAccessService
    implements IPleromaApiService {
  IPleromaApiAccessScopes calculateAvailableScopes();
  IPleromaApiFeature get getFrontendConfigurationsFeature;

  Future<IPleromaApiFrontendConfigurations> getFrontendConfigurations();

  IPleromaApiFeature get getCustomEmojisFeature;

  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis();

  IPleromaApiFeature get getCaptchaFeature;

  Future<IPleromaApiCaptcha> getCaptcha();

  IPleromaApiFeature get retrieveAppAccessTokenFeature;

  IPleromaApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature;

  Future<IPleromaApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IPleromaApiFeature get retrieveAccountAccessTokenFromRefreshTokenFeature;

  Future<IPleromaApiOAuthToken> retrieveAccountAccessTokenFromRefreshToken({
    required String refreshToken,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IPleromaApiFeature get retrieveAccountAccessTokenFromUserPasswordFeature;

  // ignore: long-parameter-list
  Future<IPleromaApiOAuthToken> retrieveAccountAccessTokenFromUserPassword({
    required String user,
    required String password,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IPleromaApiFeature get extractAuthCodeFromCallbackUrlFeature;

  String extractAuthCodeFromCallbackUrl(String url);

  Future<IPleromaApiOAuthToken> retrieveAppAccessToken({
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IPleromaApiFeature get revokeAccessTokenFeature;

  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  });

  IPleromaApiFeature get calculateAuthLoginUrlFeature;

  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IPleromaApiAccessScopes scopes,
  });

  IPleromaApiFeature get registerAppFeature;

  Future<IPleromaApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IPleromaApiAccessScopes scopes,
    required String? website,
  });

  IPleromaApiFeature get getInstanceFeature;

  Future<IPleromaApiInstance> getInstance();

  IPleromaApiFeature get getFederatedPeersFeature;

  Future<List<String>> getFederatedPeers();

  IPleromaApiFeature get getActivityFeature;

  Future<List<IPleromaApiInstanceActivityItem>> getActivity();

  IPleromaApiFeature get getDirectoryAccountsFeature;

  Future<List<IPleromaApiAccount>> getDirectoryAccounts({
    required IPleromaApiPagination? pagination,
    required bool? onlyLocal,
  });

  IPleromaApiFeature get getTrendingTagsFeature;

  Future<List<IPleromaApiTag>> getTrendingTags({
    required int? limit,
  });
}
