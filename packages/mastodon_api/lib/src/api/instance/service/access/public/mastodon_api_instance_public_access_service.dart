import '../../../../access/scopes/mastodon_api_access_scopes_model.dart';
import '../../../../account/mastodon_api_account_model.dart';
import '../../../../application/client/mastodon_api_client_application_model.dart';
import '../../../../emoji/mastodon_api_emoji_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../oauth/mastodon_api_oauth_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../../tag/mastodon_api_tag_model.dart';
import '../../../activity/item/mastodon_api_instance_activity_item_model.dart';
import '../../../mastodon_api_instance_model.dart';

abstract class IMastodonApiInstancePublicAccessService
    implements IMastodonApiService {
  IMastodonApiAccessScopes calculateAvailableScopes();
  IMastodonApiFeature get retrieveAppAccessTokenFeature;

  IMastodonApiFeature get retrieveAccountAccessTokenFromAuthCodeFeature;

  Future<IMastodonApiOAuthToken> retrieveAccountAccessTokenFromAuthCode({
    required String authCode,
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IMastodonApiFeature get extractAuthCodeFromCallbackUrlFeature;

  String extractAuthCodeFromCallbackUrl(String url);

  Future<IMastodonApiOAuthToken> retrieveAppAccessToken({
    required IMastodonApiAccessScopes scopes,
    required String? redirectUri,
    required bool? displayCodeRedirectUriWasUsed,
    required String clientId,
    required String clientSecret,
  });

  IMastodonApiFeature get revokeAccessTokenFeature;

  Future<void> revokeAccessToken({
    required String clientId,
    required String clientSecret,
    required String token,
  });

  IMastodonApiFeature get calculateAuthLoginUrlFeature;

  String calculateAuthLoginUrl({
    required bool? forceLogin,
    required String clientId,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IMastodonApiAccessScopes scopes,
  });

  IMastodonApiFeature get registerAppFeature;

  Future<IMastodonApiClientApplication> registerApp({
    required String clientName,
    required String? redirectUri,
    required bool? useDisplayCodeRedirectUri,
    required IMastodonApiAccessScopes scopes,
    required String? website,
  });

  IMastodonApiFeature get getCustomEmojisFeature;

  Future<List<IMastodonApiEmoji>> getCustomEmojis();

  IMastodonApiFeature get getInstanceFeature;

  Future<IMastodonApiInstance> getInstance();

  IMastodonApiFeature get getFederatedPeersFeature;

  Future<List<String>> getFederatedPeers();

  IMastodonApiFeature get getActivityFeature;

  Future<List<IMastodonApiInstanceActivityItem>> getActivity();

  IMastodonApiFeature get getDirectoryAccountsFeature;

  Future<List<IMastodonApiAccount>> getDirectoryAccounts({
    required IMastodonApiPagination? pagination,
    required bool? onlyLocal,
  });

  IMastodonApiFeature get getTrendingTagsFeature;

  Future<List<IMastodonApiTag>> getTrendingTags({
    required int? limit,
  });
}
