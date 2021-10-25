import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../api/captcha/unifedi_api_captcha_model.dart';
import '../../../api/emoji/unifedi_api_emoji_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/frontend_configurations/unifedi_api_frontend_configurations_model.dart';
import '../../../api/instance/activity/item/unifedi_api_instance_activity_item_model.dart';
import '../../../api/instance/service/unifedi_api_instance_service.dart';
import '../../../api/instance/unifedi_api_instance_model.dart';
import '../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/tag/unifedi_api_tag_model.dart';
import '../../access/scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';
import '../../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../../application/client/unifedi_api_client_application_model_pleroma_adapter.dart';
import '../../captcha/unifedi_api_captcha_model_pleroma_adapter.dart';
import '../../emoji/custom/unifedi_api_custom_emoji_model_pleroma_adapter.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../frontend_configurations/unifedi_api_frontend_configurations_model_pleroma_adapter.dart';
import '../../oauth/unifedi_api_oauth_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import '../activity/item/unifedi_api_instance_activity_item_model_pleroma_adapter.dart';
import '../unifedi_api_instance_model_pleroma_adapter.dart';

class UnifediApiInstanceServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiInstanceService {
  final IPleromaApiInstancePublicAccessService
      pleromaApiInstancePublicAccessService;

  UnifediApiInstanceServicePleromaAdapter({
    required this.pleromaApiInstancePublicAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiInstancePublicAccessService.restService,
      );

  @override
  IUnifediApiFeature get getActivityFeature =>
      pleromaApiInstancePublicAccessService.getActivityFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getDirectoryAccountsFeature =>
      pleromaApiInstancePublicAccessService.getDirectoryAccountsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getFrontendConfigurationsFeature =>
      pleromaApiInstancePublicAccessService.getFrontendConfigurationsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getInstanceFeature =>
      pleromaApiInstancePublicAccessService.getInstanceFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getFederatedPeersFeature =>
      pleromaApiInstancePublicAccessService.getFederatedPeersFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getTrendingTagsFeature =>
      pleromaApiInstancePublicAccessService.getTrendingTagsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiInstanceActivityItem>> getActivity() =>
      pleromaApiInstancePublicAccessService.getActivity().then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiInstanceActivityItemPleromaAdapter(),
                )
                .toList(),
          );

  @override
  Future<List<IUnifediApiAccount>> getDirectoryAccounts({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
  }) =>
      pleromaApiInstancePublicAccessService
          .getDirectoryAccounts(
            pagination: pagination?.toPleromaApiPagination(),
            onlyLocal: onlyLocal,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountPleromaAdapter(),
                )
                .toList(),
          );

  @override
  Future<IUnifediApiFrontendConfigurations> getFrontendConfigurations() =>
      pleromaApiInstancePublicAccessService.getFrontendConfigurations().then(
            (value) => value.toUnifediApiFrontendConfigurationsPleromaAdapter(),
          );

  @override
  Future<IUnifediApiInstance> getInstance() =>
      pleromaApiInstancePublicAccessService.getInstance().then(
            (value) => value.toUnifediApiInstancePleromaAdapter(),
          );

  @override
  Future<List<String>> getFederatedPeers() =>
      pleromaApiInstancePublicAccessService.getFederatedPeers();

  @override
  Future<List<IUnifediApiTag>> getTrendingTags({
    required int? limit,
  }) =>
      pleromaApiInstancePublicAccessService
          .getTrendingTags(
            limit: limit,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiTagPleromaAdapter(),
                )
                .toList(),
          );

  @override
  Future<List<IUnifediApiEmoji>> getCustomEmojis() =>
      pleromaApiInstancePublicAccessService.getCustomEmojis().then(
            (value) => value.toUnifediApiCustomEmojiPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getCustomEmojisFeature =>
      pleromaApiInstancePublicAccessService.getCustomEmojisFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get registerAppFeature =>
      pleromaApiInstancePublicAccessService.registerAppFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
    required String? website,
  }) =>
      pleromaApiInstancePublicAccessService
          .registerApp(
            clientName: clientName,
            redirectUri: redirectUri,
            useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
            scopes: scopes.toPleromaApiAccessScopes(),
            website: website,
          )
          .then(
            (value) => value.toUnifediApiClientApplicationPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get extractAuthCodeFromCallbackUrlFeature =>
      pleromaApiInstancePublicAccessService
          .extractAuthCodeFromCallbackUrlFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromAuthCodeFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get retrieveAppAccessTokenFeature =>
      pleromaApiInstancePublicAccessService.retrieveAppAccessTokenFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get calculateAuthLoginUrlFeature =>
      pleromaApiInstancePublicAccessService.calculateAuthLoginUrlFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get revokeAccessTokenFeature =>
      pleromaApiInstancePublicAccessService.revokeAccessTokenFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
  }) =>
      pleromaApiInstancePublicAccessService.calculateAuthLoginUrl(
        clientId: clientId,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        forceLogin: forceLogin,
        scopes: scopes.toPleromaApiAccessScopes(),
      );

  @override
  String extractAuthCodeFromCallbackUrl(String url) =>
      pleromaApiInstancePublicAccessService.extractAuthCodeFromCallbackUrl(url);

  @override
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromAuthCode(
            authCode: authCode,
            scopes: scopes.toPleromaApiAccessScopes(),
            redirectUri: redirectUri,
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenPleromaAdapter(),
          );

  @override
  Future<IUnifediApiOAuthToken> retrieveAppAccessToken({
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      pleromaApiInstancePublicAccessService
          .retrieveAppAccessToken(
            scopes: scopes.toPleromaApiAccessScopes(),
            redirectUri: redirectUri,
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenPleromaAdapter(),
          );

  @override
  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  }) =>
      pleromaApiInstancePublicAccessService.revokeAccessToken(
        clientId: clientId,
        clientSecret: clientSecret,
        token: token,
      );

  @override
  Future<IUnifediApiCaptcha> getCaptcha() =>
      pleromaApiInstancePublicAccessService.getCaptcha().then(
            (value) => value.toUnifediApiCaptchaPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getCaptchaFeature =>
      pleromaApiInstancePublicAccessService.getCaptchaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromRefreshToken({
    required String refreshToken,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromRefreshToken(
            refreshToken: refreshToken,
            scopes: scopes.toPleromaApiAccessScopes(),
            redirectUri: redirectUri,
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get retrieveAccountAccessTokenFromRefreshTokenFeature =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromRefreshTokenFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  // ignore: long-parameter-list
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromUserPassword({
    required String user,
    required String password,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromUserPassword(
            user: user,
            password: password,
            scopes: scopes.toPleromaApiAccessScopes(),
            redirectUri: redirectUri,
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get retrieveAccountAccessTokenFromUserPasswordFeature =>
      pleromaApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromUserPasswordFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiAccessScopes calculateAvailableScopes() =>
      pleromaApiInstancePublicAccessService
          .calculateAvailableScopes()
          .toUnifediApiAccessScopesPleromaAdapter();
}
