import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../access/scopes/pleroma_api_access_scopes_model.dart';
import '../../../../account/pleroma_api_account_model.dart';
import '../../../../account/pleroma_api_account_model_impl.dart';
import '../../../../application/client/pleroma_api_client_application_model.dart';
import '../../../../application/client/pleroma_api_client_application_model_impl.dart';
import '../../../../captcha/pleroma_api_captcha_model.dart';
import '../../../../captcha/pleroma_api_captcha_model_impl.dart';
import '../../../../emoji/custom/pleroma_api_custom_emoji_model.dart';
import '../../../../emoji/custom/pleroma_api_custom_emoji_model_impl.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../frontend_configurations/pleroma_api_frontend_configurations_model.dart';
import '../../../../frontend_configurations/pleroma_api_frontend_configurations_model_impl.dart';
import '../../../../oauth/pleroma_api_oauth_model.dart';
import '../../../../oauth/pleroma_api_oauth_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../requirement/access/level/pleroma_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/pleroma_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../../tag/pleroma_api_tag_model.dart';
import '../../../../tag/pleroma_api_tag_model_impl.dart';
import '../../../activity/item/pleroma_api_instance_activity_item_model.dart';
import '../../../activity/item/pleroma_api_instance_activity_item_model_impl.dart';
import '../../../pleroma_api_instance_model.dart';
import '../../../pleroma_api_instance_model_impl.dart';
import 'pleroma_api_instance_public_access_service.dart';

class PleromaApiInstancePublicAccessService extends PleromaApiService
    implements IPleromaApiInstancePublicAccessService {
  final frontendConfigurationsRelativeUrlPath =
      '/api/pleroma/frontend_configurations';
  final emojiRelativeUrlPath = '/api/v1/pleroma/emoji';
  static const captchaRelativeUrlPath = '/api/pleroma/captcha';
  final MastodonApiInstancePublicAccessService mastodonPublicApiInstanceService;

  PleromaApiInstancePublicAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonPublicApiInstanceService =
            MastodonApiInstancePublicAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonPublicApiInstanceService.disposeWith(this);
  }

  @override
  Future<IPleromaApiCaptcha> getCaptcha() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getCaptchaFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: captchaRelativeUrlPath,
        ),
        jsonParser: (json) => PleromaApiCaptcha.fromJson(json),
      );

  @override
  IPleromaApiFeature get getCaptchaFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getActivityFeature => PleromaApiFeature(
        mastodonApiFeature: mastodonPublicApiInstanceService.getActivityFeature,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<List<IPleromaApiInstanceActivityItem>> getActivity() =>
      restService.sendHttpRequestAndParseJsonList(
        request: mastodonPublicApiInstanceService.createGetActivityRequest(),
        jsonParser: (json) => PleromaApiInstanceActivityItem.fromJson(json),
        requestFeature: getActivityFeature,
        fieldFeatures: null,
      );

  @override
  IPleromaApiFeature get getInstanceFeature => PleromaApiFeature(
        mastodonApiFeature: mastodonPublicApiInstanceService.getInstanceFeature,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<IPleromaApiInstance> getInstance() =>
      restService.sendHttpRequestAndParseJson(
        request: mastodonPublicApiInstanceService.createGetInstanceRequest(),
        jsonParser: (json) => PleromaApiInstance.fromJson(json),
        requestFeature: getInstanceFeature,
        fieldFeatures: null,
      );

  @override
  IPleromaApiFeature get getFederatedPeersFeature => PleromaApiFeature(
        mastodonApiFeature:
            mastodonPublicApiInstanceService.getFederatedPeersFeature,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<List<String>> getFederatedPeers() =>
      restService.sendHttpRequestAndParseStringList(
        request:
            mastodonPublicApiInstanceService.createGetFederatedPeersRequest(),
        requestFeature: getFederatedPeersFeature,
        fieldFeatures: null,
      );

  @override
  IPleromaApiFeature get getDirectoryAccountsFeature => PleromaApiFeature(
        mastodonApiFeature:
            mastodonPublicApiInstanceService.getDirectoryAccountsFeature,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<List<IPleromaApiAccount>> getDirectoryAccounts({
    IPleromaApiPagination? pagination,
    bool? onlyLocal,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request:
            mastodonPublicApiInstanceService.createGetDirectoryAccountsRequest(
          onlyLocal: onlyLocal,
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
        requestFeature: getDirectoryAccountsFeature,
        fieldFeatures: null,
      );

  @override
  IPleromaApiFeature get getFrontendConfigurationsFeature => PleromaApiFeature(
        mastodonApiFeature: null,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<IPleromaApiFrontendConfigurations> getFrontendConfigurations() =>
      restService.sendHttpRequestAndParseJson(
        request: RestRequest.get(
          relativePath: frontendConfigurationsRelativeUrlPath,
        ),
        jsonParser: (json) => PleromaApiFrontendConfigurations.fromJson(json),
        requestFeature: getFrontendConfigurationsFeature,
        fieldFeatures: null,
      );

  @override
  IPleromaApiFeature get getTrendingTagsFeature => PleromaApiFeature(
        mastodonApiFeature:
            mastodonPublicApiInstanceService.getTrendingTagsFeature,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<List<IPleromaApiTag>> getTrendingTags({
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request: mastodonPublicApiInstanceService.createGetTrendingTagsQuery(
          limit: limit,
        ),
        jsonParser: (json) => PleromaApiTag.fromJson(json),
        requestFeature: getDirectoryAccountsFeature,
        fieldFeatures: null,
      );

  @override
  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis() =>
      restService.sendHttpRequestAndParse(
        requestFeature: getCustomEmojisFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: emojiRelativeUrlPath,
        ),
        parser: _parseEmojiListResponse,
      );

  @override
  IPleromaApiFeature get getCustomEmojisFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        null,
      );

  @override
  IPleromaApiFeature get registerAppFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService.registerAppFeature,
      );

  @override
  Future<IPleromaApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IPleromaApiAccessScopes scopes,
    required String? website,
  }) =>
      restService.sendHttpRequestAndParseJson(
        request: mastodonPublicApiInstanceService.createRegisterAppRequest(
          clientName: clientName,
          redirectUri: redirectUri,
          useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
          scopes: scopes,
          website: website,
        ),
        requestFeature: registerAppFeature,
        fieldFeatures: null,
        jsonParser: (json) => PleromaApiClientApplication.fromJson(json),
      );

  @override
  String extractAuthCodeFromCallbackUrl(String url) =>
      mastodonPublicApiInstanceService.extractAuthCodeFromCallbackUrl(url);

  @override
  Future<PleromaApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAccountAccessTokenFromAuthCodeFeature,
        fieldFeatures: null,
        request: mastodonPublicApiInstanceService
            .createRetrieveAccountAccessTokenFromAuthCodeRequest(
          authCode: authCode,
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        jsonParser: (json) => PleromaApiOAuthToken.fromJson(json),
      );

  @override
  Future<PleromaApiOAuthToken> retrieveAppAccessToken({
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAppAccessTokenFeature,
        fieldFeatures: null,
        request: mastodonPublicApiInstanceService
            .createRetrieveAppAccessTokenRequest(
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        jsonParser: (json) => PleromaApiOAuthToken.fromJson(json),
      );

  @override
  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: revokeAccessTokenFeature,
        fieldFeatures: null,
        request:
            mastodonPublicApiInstanceService.createRevokeAccessTokenRequest(
          clientId: clientId,
          clientSecret: clientSecret,
          token: token,
        ),
      );

  @override
  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IPleromaApiAccessScopes scopes,
  }) =>
      mastodonPublicApiInstanceService.calculateAuthLoginUrl(
        clientId: clientId,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        forceLogin: forceLogin,
        scopes: scopes,
      );

  @override
  IPleromaApiFeature get calculateAuthLoginUrlFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService.calculateAuthLoginUrlFeature,
      );

  @override
  IPleromaApiFeature get extractAuthCodeFromCallbackUrlFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService.extractAuthCodeFromCallbackUrlFeature,
      );

  @override
  IPleromaApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService
            .retrieveAccountAccessTokenFromAuthCodeFeature,
      );

  @override
  IPleromaApiFeature get retrieveAppAccessTokenFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService.retrieveAppAccessTokenFeature,
      );

  @override
  IPleromaApiFeature get revokeAccessTokenFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonPublicApiInstanceService.revokeAccessTokenFeature,
      );

  static String calculateInstanceAuthLoginUrl({
    required String instanceUrl,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required bool? forceLogin,
    required IPleromaApiAccessScopes scopes,
  }) =>
      MastodonApiInstancePublicAccessService.calculateInstanceAuthLoginUrl(
        instanceUrl: instanceUrl,
        clientId: clientId,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        forceLogin: forceLogin,
        scopes: scopes,
      );

  @override
  Future<IPleromaApiOAuthToken> retrieveAccountAccessTokenFromRefreshToken({
    required String refreshToken,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAppAccessTokenFeature,
        fieldFeatures: null,
        request: mastodonPublicApiInstanceService
            .createRetrieveAccessTokenRequest(
          grantType: 'refresh_token',
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        )
            .copyAndAppend(
          bodyJson: <String, dynamic>{
            'refresh_token': refreshToken,
          },
        ),
        jsonParser: (json) => PleromaApiOAuthToken.fromJson(json),
      );

  @override
  IPleromaApiFeature get retrieveAccountAccessTokenFromRefreshTokenFeature =>
      PleromaApiFeature.onlyPublicRequirements(null);

  @override
  // ignore: long-parameter-list
  Future<IPleromaApiOAuthToken> retrieveAccountAccessTokenFromUserPassword({
    required String user,
    required String password,
    required IPleromaApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAppAccessTokenFeature,
        fieldFeatures: null,
        request: mastodonPublicApiInstanceService
            .createRetrieveAccessTokenRequest(
          grantType: 'password',
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        )
            .copyAndAppend(
          bodyJson: <String, dynamic>{
            'user': user,
            'password': password,
          },
        ),
        jsonParser: (json) => PleromaApiOAuthToken.fromJson(json),
      );

  @override
  IPleromaApiFeature get retrieveAccountAccessTokenFromUserPasswordFeature =>
      PleromaApiFeature.onlyPublicRequirements(null);

  @override
  IPleromaApiAccessScopes calculateAvailableScopes() =>
      IPleromaApiAccessScopes.calculateAvailableScopes(
        // ignore: avoid-non-null-assertion
        restService.accessBloc.access.instance!.versionAsPleromaApi,
      );
}

// hack due to Map inside response but should be list
// {"8b_a":{"image_url":"/emoji/8bfont/8b_a.png","tags":["pack:8bfont"]}}
List<IPleromaApiCustomEmoji> _parseEmojiListResponse(
  String jsonString,
) {
  var json = jsonDecode(jsonString) as Map<String, dynamic>;

  return json is Map<String, dynamic>
      ? json.entries.map(
          (e) {
            var valueMap = e.value as Map<String, dynamic>;
            valueMap['name'] = e.key;

            return PleromaApiCustomEmoji.fromJson(valueMap);
          },
        ).toList()
      : [];
}
