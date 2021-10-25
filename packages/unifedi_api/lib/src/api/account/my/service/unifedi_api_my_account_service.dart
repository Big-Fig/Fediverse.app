import '../../../feature/unifedi_api_feature_model.dart';
import '../../../pagination/unifedi_api_pagination_model.dart';
import '../../../status/unifedi_api_status_model.dart';
import '../../../tag/unifedi_api_tag_model.dart';
import '../../../unifedi_api_service.dart';
import '../../relationship/unifedi_api_account_relationship_model.dart';
import '../../unifedi_api_account_model.dart';
import '../edit/unifedi_api_edit_my_account_model.dart';
import '../unifedi_api_my_account_model.dart';

abstract class IUnifediApiMyAccountService extends IUnifediApiService {
  IUnifediApiFeature get updateMyCredentialsFeature;

  IUnifediApiFeature get updateMyCredentialsLockedFeature;

  IUnifediApiFeature get updateMyCredentialsPrivacyFeature;

  IUnifediApiFeature get updateMyCredentialsSensitiveFeature;

  IUnifediApiFeature get updateMyCredentialsDiscoverableFeature;

  IUnifediApiFeature get updateMyCredentialsNoRichTextFeature;

  IUnifediApiFeature get updateMyCredentialsHideFollowersFeature;

  IUnifediApiFeature get updateMyCredentialsHideFollowsFeature;

  IUnifediApiFeature get updateMyCredentialsHideFollowersCountFeature;

  IUnifediApiFeature get updateMyCredentialsHideFollowsCountFeature;

  IUnifediApiFeature get updateMyCredentialsHideFavoritesFeature;

  IUnifediApiFeature get updateMyCredentialsShowRoleFeature;

  IUnifediApiFeature get updateMyCredentialsDefaultScopeFeature;

  IUnifediApiFeature get updateMyCredentialsSettingsStoreFeature;

  IUnifediApiFeature get updateMyCredentialsSkipThreadContainmentFeature;

  IUnifediApiFeature get updateMyCredentialsAllowFollowingMoveFeature;

  IUnifediApiFeature get updateMyCredentialsAcceptsChatMessagesFeature;

  IUnifediApiFeature get updateMyCredentialsAlsoKnownAsFeature;

  IUnifediApiFeature get updateMyCredentialsBackgroundImageFeature;

  IUnifediApiFeature get verifyMyCredentialsFeature;

  IUnifediApiFeature get getMyDomainBlocksFeature;

  IUnifediApiFeature get getMyAccountBlocksFeature;

  IUnifediApiFeature get getMyAccountMutesFeature;

  IUnifediApiFeature get getMyBookmarksFeature;

  IUnifediApiFeature get getMyFollowRequestsFeature;

  IUnifediApiFeature get acceptMyAccountFollowRequestFeature;

  IUnifediApiFeature get rejectMyAccountFollowRequestFeature;

  IUnifediApiFeature get getMyEndorsementsFeature;

  IUnifediApiFeature get getMyAccountFeaturedTagsFeature;

  IUnifediApiFeature get featureMyAccountTagFeature;

  IUnifediApiFeature get unfeatureMyAccountTagFeature;

  IUnifediApiFeature get getMySuggestedTagsFeature;

  IUnifediApiFeature get getMySuggestionsFeature;

  IUnifediApiFeature get removeMyAccountSuggestionFeature;

  IUnifediApiFeature get getMyFavouritesFeature;

  IUnifediApiFeature get getMyFavouritesPaginationMinIdFeature;

  Future<IUnifediApiMyAccount> updateMyCredentials({
    required IUnifediApiEditMyAccount editMyAccount,
  });

  Future<IUnifediApiMyAccount> verifyMyCredentials();

  Future<List<String>> getMyDomainBlocks({
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiAccount>> getMyAccountBlocks({
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get getMyAccountMutesWithRelationshipFeature;

  Future<List<IUnifediApiAccount>> getMyAccountMutes({
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiStatus>> getMyBookmarks({
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiStatus>> getMyFavourites({
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiAccount>> getMyFollowRequests({
    required IUnifediApiPagination? pagination,
  });

  Future<IUnifediApiAccountRelationship?> acceptMyAccountFollowRequest({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship?> rejectMyAccountFollowRequest({
    required String accountId,
  });

  Future<List<IUnifediApiAccount>> getMyEndorsements({
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiTag>> getMyAccountFeaturedTags({
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiTag>> getMySuggestedTags();

  Future<IUnifediApiTag> featureMyAccountTag({
    required String name,
  });

  Future<void> unfeatureMyAccountTag({
    required String tagId,
  });

  Future<List<IUnifediApiAccount>> getMySuggestions({
    required int? limit,
  });

  Future<void> removeMyAccountSuggestion({
    required String accountId,
  });

  IUnifediApiFeature get editNotificationsSettingsFeature;

  Future<void> editNotificationsSettings({
    required bool? blockFromStrangers,
    required bool? hideNotificationContents,
  });
}
