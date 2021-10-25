import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../featured_tags/pleroma_api_featured_tags_model.dart';
import '../../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../../service/pleroma_api_service.dart';
import '../../../../../status/pleroma_api_status_model.dart';
import '../../../../../tag/pleroma_api_tag_model.dart';
import '../../../../pleroma_api_account_model.dart';
import '../../../../relationship/pleroma_api_account_relationship_model.dart';
import '../../../edit/pleroma_api_edit_my_account_model.dart';
import '../../../pleroma_api_my_account_model.dart';

abstract class IPleromaApiMyAccountUserAccessService
    extends IPleromaApiService {
  IPleromaApiFeature get updateMyCredentialsFeature;

  IPleromaApiFeature get updateMyCredentialsLockedFeature;

  IPleromaApiFeature get updateMyCredentialsPrivacyFeature;

  IPleromaApiFeature get updateMyCredentialsSensitiveFeature;

  IPleromaApiFeature get updateMyCredentialsDiscoverableFeature;

  IPleromaApiFeature get verifyMyCredentialsFeature;

  IPleromaApiFeature get getMyDomainBlocksFeature;

  IPleromaApiFeature get getMyAccountBlocksFeature;

  IPleromaApiFeature get getMyAccountMutesFeature;

  IPleromaApiFeature get getMyBookmarksFeature;

  IPleromaApiFeature get getMyFollowRequestsFeature;

  IPleromaApiFeature get acceptMyAccountFollowRequestFeature;

  IPleromaApiFeature get rejectMyAccountFollowRequestFeature;

  IPleromaApiFeature get getMyEndorsementsFeature;

  IPleromaApiFeature get getMyAccountFeaturedTagsFeature;

  IPleromaApiFeature get featureMyAccountTagFeature;

  IPleromaApiFeature get unfeatureMyAccountTagFeature;

  IPleromaApiFeature get getMySuggestedTagsFeature;

  IPleromaApiFeature get getMySuggestionsFeature;

  IPleromaApiFeature get removeMyAccountSuggestionFeature;

  IPleromaApiFeature get getMyFavouritesFeature;

  IPleromaApiFeature get getMyFavouritesPaginationMinIdFeature;

  Future<IPleromaApiMyAccount> updateMyCredentials({
    required IPleromaApiEditMyAccount editMyAccount,
  });

  Future<IPleromaApiMyAccount> verifyMyCredentials();

  Future<List<String>> getMyDomainBlocks({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiAccount>> getMyAccountBlocks({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiAccount>> getMyAccountMutes({
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiStatus>> getMyBookmarks({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiStatus>> getMyFavourites({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiAccount>> getMyFollowRequests({
    required IPleromaApiPagination? pagination,
  });

  Future<IPleromaApiAccountRelationship> acceptMyAccountFollowRequest({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> rejectMyAccountFollowRequest({
    required String accountId,
  });

  Future<List<IPleromaApiAccount>> getMyEndorsements({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiFeaturedTag>> getMyAccountFeaturedTags({
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiTag>> getMySuggestedTags();

  Future<IPleromaApiFeaturedTag> featureMyAccountTag({
    required String name,
  });

  Future<void> unfeatureMyAccountTag({
    required String tagId,
  });

  Future<List<IPleromaApiAccount>> getMySuggestions({
    required int? limit,
  });

  Future<void> removeMyAccountSuggestion({
    required String accountId,
  });

  IPleromaApiFeature get editNotificationsSettingsFeature;

  Future<void> editNotificationsSettings({
    required bool? blockFromStrangers,
    required bool? hideNotificationContents,
  });
}
