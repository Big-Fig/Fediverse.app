import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../featured_tags/mastodon_api_featured_tags_model.dart';
import '../../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../../service/mastodon_api_service.dart';
import '../../../../../status/mastodon_api_status_model.dart';
import '../../../../../tag/mastodon_api_tag_model.dart';
import '../../../../mastodon_api_account_model.dart';
import '../../../../relationship/mastodon_api_account_relationship_model.dart';
import '../../../edit/mastodon_api_edit_my_account_model.dart';
import '../../../mastodon_api_my_account_model.dart';

abstract class IMastodonApiMyAccountUserAccessService
    extends IMastodonApiService {
  IMastodonApiFeature get updateMyCredentialsFeature;

  IMastodonApiFeature get updateMyCredentialsLockedFeature;

  IMastodonApiFeature get updateMyCredentialsPrivacyFeature;

  IMastodonApiFeature get updateMyCredentialsSensitiveFeature;

  IMastodonApiFeature get updateMyCredentialsDiscoverableFeature;

  IMastodonApiFeature get verifyMyCredentialsFeature;

  IMastodonApiFeature get getMyDomainBlocksFeature;

  IMastodonApiFeature get getMyAccountBlocksFeature;

  IMastodonApiFeature get getMyAccountMutesFeature;

  IMastodonApiFeature get getMyBookmarksFeature;

  IMastodonApiFeature get getMyFollowRequestsFeature;

  IMastodonApiFeature get acceptMyAccountFollowRequestFeature;

  IMastodonApiFeature get rejectMyAccountFollowRequestFeature;

  IMastodonApiFeature get getMyEndorsementsFeature;

  IMastodonApiFeature get getMyAccountFeaturedTagsFeature;

  IMastodonApiFeature get featureMyAccountTagFeature;

  IMastodonApiFeature get unfeatureMyAccountTagFeature;

  IMastodonApiFeature get getMySuggestedTagsFeature;

  IMastodonApiFeature get getMySuggestionsFeature;

  IMastodonApiFeature get removeMyAccountSuggestionFeature;

  IMastodonApiFeature get getMyFavouritesFeature;

  IMastodonApiFeature get getMyFavouritesPaginationMinIdFeature;

  Future<IMastodonApiMyAccount> updateMyCredentials({
    required IMastodonApiEditMyAccount editMyAccount,
  });

  Future<IMastodonApiMyAccount> verifyMyCredentials();

  Future<List<String>> getMyDomainBlocks({
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiAccount>> getMyAccountBlocks({
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiAccount>> getMyAccountMutes({
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiStatus>> getMyBookmarks({
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiAccount>> getMyFollowRequests({
    required IMastodonApiPagination? pagination,
  });

  Future<IMastodonApiAccountRelationship?> acceptMyAccountFollowRequest({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship?> rejectMyAccountFollowRequest({
    required String accountId,
  });

  Future<List<IMastodonApiAccount>> getMyEndorsements({
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiFeaturedTag>> getMyAccountFeaturedTags({
    required IMastodonApiPagination? pagination,
  });

  Future<IMastodonApiFeaturedTag> featureMyAccountTag({
    required String name,
  });

  Future<void> unfeatureMyAccountTag({
    required String tagId,
  });

  Future<List<IMastodonApiTag>> getMySuggestedTags();

  Future<List<IMastodonApiAccount>> getMySuggestions({
    required int? limit,
  });

  Future<void> removeMyAccountSuggestion({
    required String accountId,
  });

  Future<List<IMastodonApiStatus>> getMyFavourites({
    required IMastodonApiPagination? pagination,
  });
}
