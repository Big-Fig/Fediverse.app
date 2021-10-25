import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../../../mastodon_api.dart';
import '../../../../access/mastodon_api_access_model.dart';
import '../../../../access/scopes/mastodon_api_access_scopes_model.dart';
import '../../../../account/mastodon_api_account_model.dart';
import '../../../../account/mastodon_api_account_model_impl.dart';
import '../../../../application/client/mastodon_api_client_application_model.dart';
import '../../../../application/client/mastodon_api_client_application_model_impl.dart';
import '../../../../emoji/mastodon_api_emoji_model.dart';
import '../../../../emoji/mastodon_api_emoji_model_impl.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../oauth/mastodon_api_oauth_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../../tag/mastodon_api_tag_model.dart';
import '../../../../tag/mastodon_api_tag_model_impl.dart';
import '../../../activity/item/mastodon_api_instance_activity_item_model.dart';
import '../../../activity/item/mastodon_api_instance_activity_item_model_impl.dart';
import '../../../mastodon_api_instance_model.dart';
import '../../../mastodon_api_instance_model_impl.dart';
import 'mastodon_api_instance_public_access_service.dart';

class MastodonApiInstancePublicAccessService extends MastodonApiService
    implements IMastodonApiInstancePublicAccessService {
  static const retrieveAccessTokenAsCodeRedirectUri =
      'urn:ietf:wg:oauth:2.0:oob';
  static const oauthRelativeUrlPath = '/oauth/';

  static const appsRelativeUrlPath = '/api/v1/apps/';
  static const instanceRelativeUrlPath = '/api/v1/instance';

  static const directoryRelativeUrlPath = '/api/v1/directory';
  static const emojiRelativeUrlPath = '/api/v1/custom_emojis';

  static const trendsRelativeUrlPath = '/api/v1/trends';
  static const retrieveAccountAccessTokenFromAuthCodeGrantType =
      'authorization_code';
  static const retrieveAppAccessTokenGrantType = 'client_credentials';

  MastodonApiInstancePublicAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  MastodonApiFeature get getActivityFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_2,
      );

  @override
  Future<List<IMastodonApiInstanceActivityItem>> getActivity() =>
      restService.sendHttpRequestAndParseJsonList(
        request: createGetActivityRequest(),
        jsonParser: (json) => MastodonApiInstanceActivityItem.fromJson(json),
        requestFeature: getActivityFeature,
        fieldFeatures: createGetActivityFieldFeatures(),
      );

  List<IMastodonApiFeature>? createGetActivityFieldFeatures() => null;

  RestRequest createGetActivityRequest() => RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            instanceRelativeUrlPath,
            'activity',
          ],
        ),
      );

  @override
  MastodonApiFeature get getInstanceFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast1_1_0,
      );

  @override
  Future<IMastodonApiInstance> getInstance() =>
      restService.sendHttpRequestAndParseJson(
        request: createGetInstanceRequest(),
        jsonParser: (json) => MastodonApiInstance.fromJson(json),
        requestFeature: getInstanceFeature,
        fieldFeatures: createGetInstanceFieldFeatures(),
      );

  List<IMastodonApiFeature>? createGetInstanceFieldFeatures() => null;

  RestRequest createGetInstanceRequest() => RestRequest.get(
        relativePath: instanceRelativeUrlPath,
      );

  @override
  MastodonApiFeature get getFederatedPeersFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_2,
      );

  @override
  Future<List<String>> getFederatedPeers() =>
      restService.sendHttpRequestAndParseStringList(
        request: createGetFederatedPeersRequest(),
        requestFeature: getFederatedPeersFeature,
        fieldFeatures: createGetFederatedPeersFeatures(),
      );

  List<IMastodonApiFeature>? createGetFederatedPeersFeatures() => null;

  RestRequest createGetFederatedPeersRequest() => RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            instanceRelativeUrlPath,
            'peers',
          ],
        ),
      );

  @override
  MastodonApiFeature get getDirectoryAccountsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  Future<List<IMastodonApiAccount>> getDirectoryAccounts({
    required IMastodonApiPagination? pagination,
    required bool? onlyLocal,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request: createGetDirectoryAccountsRequest(
          onlyLocal: onlyLocal,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
        requestFeature: getDirectoryAccountsFeature,
        fieldFeatures: createGetDirectoryAccountsFeatures(),
      );

  List<IMastodonApiFeature>? createGetDirectoryAccountsFeatures() => null;

  RestRequest createGetDirectoryAccountsRequest({
    required bool? onlyLocal,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            directoryRelativeUrlPath,
          ],
        ),
        queryArgs: [
          if (onlyLocal != null)
            UrlQueryArg(
              key: 'local',
              value: onlyLocal.toString(),
            ),
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  MastodonApiFeature get getTrendingTagsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  Future<List<IMastodonApiTag>> getTrendingTags({
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request: createGetTrendingTagsQuery(
          limit: limit,
        ),
        jsonParser: (json) => MastodonApiTag.fromJson(json),
        requestFeature: getDirectoryAccountsFeature,
        fieldFeatures: createGetTrendingTagsFeatures(),
      );

  List<IMastodonApiFeature>? createGetTrendingTagsFeatures() => null;

  RestRequest createGetTrendingTagsQuery({
    required int? limit,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            trendsRelativeUrlPath,
          ],
        ),
        queryArgs: [
          if (limit != null)
            UrlQueryArg(
              key: 'limit',
              value: limit.toString(),
            ),
        ],
      );

  @override
  Future<List<IMastodonApiEmoji>> getCustomEmojis() =>
      restService.sendHttpRequestAndParseJsonList(
        request: RestRequest.get(
          relativePath: emojiRelativeUrlPath,
        ),
        jsonParser: (json) => MastodonApiEmoji.fromJson(json),
        requestFeature: getCustomEmojisFeature,
        fieldFeatures: null,
      );

  @override
  IMastodonApiFeature get getCustomEmojisFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_0_0,
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get registerAppFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  Future<IMastodonApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IMastodonApiAccessScopes scopes,
    required String? website,
  }) async {
    var clientApplication = await restService.sendHttpRequestAndParseJson(
      requestFeature: registerAppFeature,
      fieldFeatures: createRegisterAppFieldFeatures(),
      request: createRegisterAppRequest(
        clientName: clientName,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        scopes: scopes,
        website: website,
      ),
      jsonParser: (json) => MastodonApiClientApplication.fromJson(json),
    );

    return clientApplication;
  }

  List<IMastodonApiFeature>? createRegisterAppFieldFeatures() => null;

  RestRequest createRegisterAppRequest({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IMastodonApiAccessScopes scopes,
    required String? website,
  }) {
    assertRedirectUri(
      redirectUri: redirectUri,
      useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
    );

    return RestRequest.post(
      relativePath: appsRelativeUrlPath,
      bodyJson: <String, dynamic>{
        'client_name': clientName,
        if (redirectUri != null) 'redirect_uris': redirectUri,
        if (useDisplayCodeRedirectUri == true)
          'redirect_uris': retrieveAccessTokenAsCodeRedirectUri,
        'scopes': scopes.calculateScopesString(),
        if (website != null) 'website': website,
      },
    );
  }

  static void assertRedirectUri({
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
  }) {
    assert(
      !(redirectUri != null && useDisplayCodeRedirectUri == true),
      "Can't use redirectUri with useDisplayCodeRedirectUri=true",
    );
    assert(
      !(redirectUri == null && useDisplayCodeRedirectUri != true),
      'RedirectUri or useDisplayCodeRedirectUri=true should be specified',
    );
  }

  @override
  String extractAuthCodeFromCallbackUrl(String url) =>
      Uri.parse(url).queryParameters['code'].toString();

  @override
  Future<MastodonApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAccountAccessTokenFromAuthCodeFeature,
        fieldFeatures:
            createRetrieveAccountAccessTokenFromAuthCodeFieldFeatures(),
        request: createRetrieveAccountAccessTokenFromAuthCodeRequest(
          authCode: authCode,
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        jsonParser: (json) => MastodonApiOAuthToken.fromJson(json),
      );

  List<IMastodonApiFeature>?
      createRetrieveAccountAccessTokenFromAuthCodeFieldFeatures() => null;

  IRestRequest createRetrieveAccountAccessTokenFromAuthCodeRequest({
    required String authCode,
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      createRetrieveAccessTokenRequest(
        grantType: retrieveAccountAccessTokenFromAuthCodeGrantType,
        scopes: scopes,
        redirectUri: redirectUri,
        displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
        clientId: clientId,
        clientSecret: clientSecret,
      ).copyAndAppend(
        bodyJson: <String, String>{
          'code': authCode,
        },
      );

  @override
  Future<MastodonApiOAuthToken> retrieveAppAccessToken({
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: retrieveAppAccessTokenFeature,
        fieldFeatures: createRetrieveAppAccessTokenFieldFeatures(),
        request: createRetrieveAppAccessTokenRequest(
          scopes: scopes,
          redirectUri: redirectUri,
          displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
          clientId: clientId,
          clientSecret: clientSecret,
        ),
        jsonParser: (json) => MastodonApiOAuthToken.fromJson(json),
      );

  List<IMastodonApiFeature>? createRetrieveAppAccessTokenFieldFeatures() =>
      null;

  RestRequest createRetrieveAppAccessTokenRequest({
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) =>
      createRetrieveAccessTokenRequest(
        grantType: retrieveAppAccessTokenGrantType,
        scopes: scopes,
        redirectUri: redirectUri,
        displayCodeRedirectUriWasUsed: displayCodeRedirectUriWasUsed,
        clientId: clientId,
        clientSecret: clientSecret,
      );

  RestRequest createRetrieveAccessTokenRequest({
    required IMastodonApiAccessScopes scopes,
    required String grantType,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  }) {
    assertRedirectUri(
      redirectUri: redirectUri,
      useDisplayCodeRedirectUri: displayCodeRedirectUriWasUsed,
    );

    return RestRequest.post(
      relativePath: UrlPathHelper.join(
        [
          oauthRelativeUrlPath,
          'token',
        ],
      ),
      bodyJson: <String, dynamic>{
        'grant_type': grantType,
        'scope': scopes.calculateScopesString(),
        if (redirectUri != null) 'redirect_uri': redirectUri,
        if (displayCodeRedirectUriWasUsed == true)
          'redirect_uri': retrieveAccessTokenAsCodeRedirectUri,
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );
  }

  @override
  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: revokeAccessTokenFeature,
        fieldFeatures: createRevokeAccessTokenFieldFeatures(),
        request: createRevokeAccessTokenRequest(
          clientId: clientId,
          clientSecret: clientSecret,
          token: token,
        ),
      );

  List<IMastodonApiFeature>? createRevokeAccessTokenFieldFeatures() => null;

  RestRequest createRevokeAccessTokenRequest({
    required String clientId,
    required String clientSecret,
    required String token,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            oauthRelativeUrlPath,
            'revoke',
          ],
        ),
        bodyJson: <String, dynamic>{
          'client_id': clientId,
          'client_secret': clientSecret,
          'token': token,
        },
      );

  // ignore: long-method
  static String calculateInstanceAuthLoginUrl({
    required String instanceUrl,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required bool? forceLogin,
    required IMastodonApiAccessScopes scopes,
  }) {
    assertRedirectUri(
      redirectUri: redirectUri,
      useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
    );

    var scopesString = scopes.calculateScopesString();
    scopesString = scopesString.replaceAll(' ', '%20');
    var queryArgs = [
      if (forceLogin != null)
        UrlQueryArg(
          key: 'force_login',
          value: forceLogin.toString(),
        ),
      // required by server-side
      const UrlQueryArg(
        key: 'response_type',
        value: 'code',
      ),
      UrlQueryArg(
        key: 'client_id',
        value: clientId,
      ),
      if (redirectUri != null)
        UrlQueryArg(
          key: 'redirect_uri',
          value: redirectUri,
        ),
      if (useDisplayCodeRedirectUri == true)
        const UrlQueryArg(
          key: 'redirect_uri',
          value: retrieveAccessTokenAsCodeRedirectUri,
        ),
      UrlQueryArg(
        key: 'scope',
        value: scopesString,
      ),
    ];

    var relativeUrl = UrlPathHelper.join(
      [
        oauthRelativeUrlPath,
        'authorize',
      ],
    );

    var argsQueryPart = queryArgs.toQueryPart();

    // todo: remove hack
    var actualInstanceUrl = instanceUrl.endsWith('/')
        ? instanceUrl.substring(0, instanceUrl.length - 1)
        : instanceUrl;

    return UrlPathHelper.join(
      [
        actualInstanceUrl,
        '$relativeUrl?$argsQueryPart',
      ],
    );
  }

  @override
  IMastodonApiFeature get calculateAuthLoginUrlFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature get extractAuthCodeFromCallbackUrlFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature get retrieveAppAccessTokenFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature get revokeAccessTokenFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IMastodonApiAccessScopes scopes,
  }) =>
      calculateInstanceAuthLoginUrl(
        instanceUrl: restService.accessBloc.access.url,
        clientId: clientId,
        redirectUri: redirectUri,
        useDisplayCodeRedirectUri: useDisplayCodeRedirectUri,
        forceLogin: forceLogin,
        scopes: scopes,
      );

  @override
  IMastodonApiAccessScopes calculateAvailableScopes() =>
      IMastodonApiAccessScopes.calculateAvailableScopes(
        // ignore: avoid-non-null-assertion
        version: restService.accessBloc.access.instance?.versionAsMastodonApi,
      );
}
