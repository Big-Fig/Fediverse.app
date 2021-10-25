import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/access/scopes/unifedi_api_access_scopes_model.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/application/client/unifedi_api_client_application_model.dart';
import '../../../api/captcha/unifedi_api_captcha_model.dart';
import '../../../api/emoji/unifedi_api_emoji_model.dart';
import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/frontend_configurations/unifedi_api_frontend_configurations_model.dart';
import '../../../api/instance/activity/item/unifedi_api_instance_activity_item_model.dart';
import '../../../api/instance/service/unifedi_api_instance_service.dart';
import '../../../api/instance/unifedi_api_instance_model.dart';
import '../../../api/oauth/unifedi_api_oauth_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/tag/unifedi_api_tag_model.dart';
import '../../access/scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';
import '../../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../../application/client/unifedi_api_client_application_model_mastodon_adapter.dart';
import '../../emoji/unifedi_api_emoji_model_mastodon_adapter.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../oauth/unifedi_api_oauth_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../../tag/unifedi_api_tag_model_mastodon_adapter.dart';
import '../activity/item/unifedi_api_instance_activity_item_model_mastodon_adapter.dart';
import '../unifedi_api_instance_model_mastodon_adapter.dart';

class UnifediApiInstanceServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiInstanceService {
  final IMastodonApiInstancePublicAccessService
      mastodonApiInstancePublicAccessService;

  UnifediApiInstanceServiceMastodonAdapter({
    required this.mastodonApiInstancePublicAccessService,
  });

  @override
  IUnifediApiFeature get registerAppFeature =>
      mastodonApiInstancePublicAccessService.registerAppFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
    required String? website,
  }) =>
      mastodonApiInstancePublicAccessService
          .registerApp(
            clientName: clientName,
            redirectUri: redirectUri,
            useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
            scopes: scopes.toMastodonApiAccessScopes(),
            website: website,
          )
          .then(
            (value) => value.toUnifediApiClientApplicationMastodonAdapter(),
          );

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiInstancePublicAccessService.restService,
      );

  @override
  IUnifediApiFeature get getActivityFeature =>
      mastodonApiInstancePublicAccessService.getActivityFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getDirectoryAccountsFeature =>
      mastodonApiInstancePublicAccessService.getDirectoryAccountsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature get getFrontendConfigurationsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getFrontendConfigurations',
      );

  @override
  IUnifediApiFeature get getInstanceFeature =>
      mastodonApiInstancePublicAccessService.getInstanceFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getFederatedPeersFeature =>
      mastodonApiInstancePublicAccessService.getFederatedPeersFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getTrendingTagsFeature =>
      mastodonApiInstancePublicAccessService.getTrendingTagsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiInstanceActivityItem>> getActivity() =>
      mastodonApiInstancePublicAccessService.getActivity().then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiInstanceActivityItemMastodonAdapter(),
                )
                .toList(),
          );

  @override
  Future<List<IUnifediApiAccount>> getDirectoryAccounts({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
  }) =>
      mastodonApiInstancePublicAccessService
          .getDirectoryAccounts(
            pagination: pagination?.toMastodonApiPagination(),
            onlyLocal: onlyLocal,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountMastodonAdapter(),
                )
                .toList(),
          );

  @override
  Future<IUnifediApiFrontendConfigurations> getFrontendConfigurations() =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getFrontendConfigurationsFeature,
      );

  @override
  Future<IUnifediApiInstance> getInstance() =>
      mastodonApiInstancePublicAccessService.getInstance().then(
            (value) => value.toUnifediApiInstanceMastodonAdapter(),
          );

  @override
  Future<List<String>> getFederatedPeers() =>
      mastodonApiInstancePublicAccessService.getFederatedPeers();

  @override
  Future<List<IUnifediApiTag>> getTrendingTags({
    required int? limit,
  }) =>
      mastodonApiInstancePublicAccessService
          .getTrendingTags(
            limit: limit,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiTagMastodonAdapter(),
                )
                .toList(),
          );

  @override
  Future<List<IUnifediApiEmoji>> getCustomEmojis() =>
      mastodonApiInstancePublicAccessService.getCustomEmojis().then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiEmojiMastodonAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getCustomEmojisFeature =>
      mastodonApiInstancePublicAccessService.getCustomEmojisFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get extractAuthCodeFromCallbackUrlFeature =>
      mastodonApiInstancePublicAccessService
          .extractAuthCodeFromCallbackUrlFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature =>
      mastodonApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromAuthCodeFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get retrieveAppAccessTokenFeature =>
      mastodonApiInstancePublicAccessService.retrieveAppAccessTokenFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get calculateAuthLoginUrlFeature =>
      mastodonApiInstancePublicAccessService.calculateAuthLoginUrlFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get revokeAccessTokenFeature =>
      mastodonApiInstancePublicAccessService.revokeAccessTokenFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IUnifediApiAccessScopes scopes,
  }) =>
      mastodonApiInstancePublicAccessService.calculateAuthLoginUrl(
        clientId: clientId,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        forceLogin: forceLogin,
        scopes: scopes.toMastodonApiAccessScopes(),
      );

  @override
  String extractAuthCodeFromCallbackUrl(String url) =>
      mastodonApiInstancePublicAccessService
          .extractAuthCodeFromCallbackUrl(url);

  @override
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      mastodonApiInstancePublicAccessService
          .retrieveAccountAccessTokenFromAuthCode(
            authCode: authCode,
            scopes: scopes.toMastodonApiAccessScopes(),
            redirectUri: redirectUri,
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenMastodonAdapter(),
          );

  @override
  Future<IUnifediApiOAuthToken> retrieveAppAccessToken({
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      mastodonApiInstancePublicAccessService
          .retrieveAppAccessToken(
            scopes: scopes.toMastodonApiAccessScopes(),
            displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
            redirectUri: redirectUri,
            clientId: clientId,
            clientSecret: clientSecret,
          )
          .then(
            (value) => value.toUnifediApiOAuthTokenMastodonAdapter(),
          );

  @override
  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  }) =>
      mastodonApiInstancePublicAccessService.revokeAccessToken(
        clientId: clientId,
        clientSecret: clientSecret,
        token: token,
      );

  @override
  Future<IUnifediApiCaptcha> getCaptcha() =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getCaptchaFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getCaptchaFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getCaptchaFeature',
      );

  @override
  Future<IUnifediApiOAuthToken> retrieveAccountAccessTokenFromRefreshToken({
    required String refreshToken,
    required IUnifediApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: retrieveAccountAccessTokenFromRefreshTokenFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get retrieveAccountAccessTokenFromRefreshTokenFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'retrieveAccountAccessTokenFromRefreshTokenFeature',
          );

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
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: retrieveAccountAccessTokenFromUserPasswordFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get retrieveAccountAccessTokenFromUserPasswordFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'retrieveAccountAccessTokenFromUserPasswordFeature',
          );

  @override
  IUnifediApiAccessScopes calculateAvailableScopes() =>
      mastodonApiInstancePublicAccessService
          .calculateAvailableScopes()
          .toUnifediApiAccessScopesMastodonAdapter();
}
