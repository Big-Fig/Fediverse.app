import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/account/my/edit/unifedi_api_edit_my_account_model.dart';
import '../../../../api/account/my/service/unifedi_api_my_account_service.dart';
import '../../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../../api/account/unifedi_api_account_model.dart';
import '../../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../../api/status/unifedi_api_status_model.dart';
import '../../../../api/tag/unifedi_api_tag_model.dart';
import '../../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../../featured_tags/unifedi_api_featured_tags_model_pleroma_adapter.dart';
import '../../../field/unifedi_api_field_model_pleroma_adapter.dart';
import '../../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../../../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import '../../relationship/unifedi_api_account_relationship_model_pleroma_adapter.dart';
import '../../unifedi_api_account_model_pleroma_adapter.dart';
import '../unifedi_api_my_account_model_pleroma_adapter.dart';

class UnifediApiMyAccountServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiMyAccountService {
  final IPleromaApiMyAccountUserAccessService
      pleromaApiMyAccountUserAccessService;

  UnifediApiMyAccountServicePleromaAdapter({
    required this.pleromaApiMyAccountUserAccessService,
  });

  @override
  Future<IUnifediApiAccountRelationship> acceptMyAccountFollowRequest({
    required String accountId,
  }) =>
      pleromaApiMyAccountUserAccessService
          .acceptMyAccountFollowRequest(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get acceptMyAccountFollowRequestFeature =>
      pleromaApiMyAccountUserAccessService.acceptMyAccountFollowRequestFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiTag> featureMyAccountTag({
    required String name,
  }) =>
      pleromaApiMyAccountUserAccessService.featureMyAccountTag(name: name).then(
            (value) => value.toUnifediApiFeaturedTagPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get featureMyAccountTagFeature =>
      pleromaApiMyAccountUserAccessService.featureMyAccountTagFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyAccountBlocks({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyAccountBlocks(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyAccountBlocksFeature =>
      pleromaApiMyAccountUserAccessService.getMyAccountBlocksFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyAccountMutes({
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyAccountMutes(
            withRelationship: withRelationship,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyAccountMutesFeature =>
      pleromaApiMyAccountUserAccessService.getMyAccountMutesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiStatus>> getMyBookmarks({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyBookmarks(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyBookmarksFeature =>
      pleromaApiMyAccountUserAccessService.getMyBookmarksFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<String>> getMyDomainBlocks({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService.getMyDomainBlocks(
        pagination: pagination?.toPleromaApiPagination(),
      );

  @override
  IUnifediApiFeature get getMyDomainBlocksFeature =>
      pleromaApiMyAccountUserAccessService.getMyDomainBlocksFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyEndorsements({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyEndorsements(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyEndorsementsFeature =>
      pleromaApiMyAccountUserAccessService.getMyEndorsementsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiStatus>> getMyFavourites({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyFavourites(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyFavouritesFeature =>
      pleromaApiMyAccountUserAccessService.getMyFavouritesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getMyFavouritesPaginationMinIdFeature =>
      pleromaApiMyAccountUserAccessService.getMyFavouritesPaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiTag>> getMyAccountFeaturedTags({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyAccountFeaturedTags(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiFeaturedTagPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyAccountFeaturedTagsFeature =>
      pleromaApiMyAccountUserAccessService.getMyAccountFeaturedTagsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyFollowRequests({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiMyAccountUserAccessService
          .getMyFollowRequests(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyFollowRequestsFeature =>
      pleromaApiMyAccountUserAccessService.getMyFollowRequestsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiTag>> getMySuggestedTags() =>
      pleromaApiMyAccountUserAccessService.getMySuggestedTags().then(
            (value) => value.toUnifediApiTagPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMySuggestedTagsFeature =>
      pleromaApiMyAccountUserAccessService.getMySuggestedTagsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMySuggestions({
    required int? limit,
  }) =>
      pleromaApiMyAccountUserAccessService.getMySuggestions(limit: limit).then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getMySuggestionsFeature =>
      pleromaApiMyAccountUserAccessService.getMySuggestionsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> rejectMyAccountFollowRequest({
    required String accountId,
  }) =>
      pleromaApiMyAccountUserAccessService
          .rejectMyAccountFollowRequest(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get rejectMyAccountFollowRequestFeature =>
      pleromaApiMyAccountUserAccessService.rejectMyAccountFollowRequestFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> removeMyAccountSuggestion({
    required String accountId,
  }) =>
      pleromaApiMyAccountUserAccessService.removeMyAccountSuggestion(
        accountId: accountId,
      );

  @override
  IUnifediApiFeature get removeMyAccountSuggestionFeature =>
      pleromaApiMyAccountUserAccessService.removeMyAccountSuggestionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiMyAccountUserAccessService.restService,
      );

  @override
  Future<void> unfeatureMyAccountTag({
    required String tagId,
  }) =>
      pleromaApiMyAccountUserAccessService.unfeatureMyAccountTag(tagId: tagId);

  @override
  IUnifediApiFeature get unfeatureMyAccountTagFeature =>
      pleromaApiMyAccountUserAccessService.unfeatureMyAccountTagFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  // ignore:long-parameter-list
  Future<IUnifediApiMyAccount> updateMyCredentials({
    required IUnifediApiEditMyAccount editMyAccount,
  }) =>
      pleromaApiMyAccountUserAccessService
          .updateMyCredentials(
            editMyAccount: PleromaApiEditMyAccount(
              fieldsAttributes:
                  editMyAccount.fieldsAttributes?.toPleromaApiFieldList(),
              discoverable: editMyAccount.discoverable,
              bot: editMyAccount.bot,
              displayName: editMyAccount.displayName,
              note: editMyAccount.note,
              locked: editMyAccount.locked,
              privacy: editMyAccount.privacy,
              sensitive: editMyAccount.sensitive,
              language: editMyAccount.language,
              avatarLocalFilePath: editMyAccount.avatarLocalFilePath,
              deleteAvatar: editMyAccount.deleteAvatar,
              headerLocalFilePath: editMyAccount.headerLocalFilePath,
              deleteHeader: editMyAccount.deleteHeader,
              noRichText: editMyAccount.noRichText,
              hideFollowers: editMyAccount.hideFollowers,
              hideFollows: editMyAccount.hideFollows,
              hideFollowersCount: editMyAccount.hideFollowersCount,
              hideFollowsCount: editMyAccount.hideFollowsCount,
              hideFavorites: editMyAccount.hideFavorites,
              showRole: editMyAccount.showRole,
              defaultScope: editMyAccount.defaultScope,
              pleromaSettingsStore: editMyAccount.settingsStore,
              skipThreadContainment: editMyAccount.skipThreadContainment,
              allowFollowingMove: editMyAccount.allowFollowingMove,
              acceptsChatMessages: editMyAccount.acceptsChatMessages,
              alsoKnownAs: editMyAccount.alsoKnownAs,
              pleromaBackgroundImageLocalFilePath:
                  editMyAccount.backgroundImageLocalFilePath,
              deletePleromaBackgroundImage: editMyAccount.deleteBackgroundImage,
            ),
          )
          .then(
            (value) => value.toUnifediApiMyAccountPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get updateMyCredentialsDiscoverableFeature =>
      pleromaApiMyAccountUserAccessService
          .updateMyCredentialsDiscoverableFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsFeature =>
      pleromaApiMyAccountUserAccessService.updateMyCredentialsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsLockedFeature =>
      pleromaApiMyAccountUserAccessService.updateMyCredentialsLockedFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsPrivacyFeature =>
      pleromaApiMyAccountUserAccessService.updateMyCredentialsPrivacyFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsSensitiveFeature =>
      pleromaApiMyAccountUserAccessService.updateMyCredentialsSensitiveFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiMyAccount> verifyMyCredentials() =>
      pleromaApiMyAccountUserAccessService.verifyMyCredentials().then(
            (value) => value.toUnifediApiMyAccountPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get verifyMyCredentialsFeature =>
      pleromaApiMyAccountUserAccessService.verifyMyCredentialsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getMyAccountMutesWithRelationshipFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsAcceptsChatMessagesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsAllowFollowingMoveFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsAlsoKnownAsFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsBackgroundImageFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsDefaultScopeFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsHideFavoritesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsHideFollowersCountFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsHideFollowersFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsHideFollowsCountFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsHideFollowsFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsNoRichTextFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsSettingsStoreFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsShowRoleFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get updateMyCredentialsSkipThreadContainmentFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  Future<void> editNotificationsSettings({
    required bool? blockFromStrangers,
    required bool? hideNotificationContents,
  }) =>
      pleromaApiMyAccountUserAccessService.editNotificationsSettings(
        blockFromStrangers: blockFromStrangers,
        hideNotificationContents: hideNotificationContents,
      );

  @override
  IUnifediApiFeature get editNotificationsSettingsFeature =>
      pleromaApiMyAccountUserAccessService.editNotificationsSettingsFeature
          .toUnifediApiFeaturePleromaAdapter();
}
