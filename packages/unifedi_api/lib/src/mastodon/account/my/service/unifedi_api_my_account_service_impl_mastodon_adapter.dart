import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/account/my/edit/unifedi_api_edit_my_account_model.dart';
import '../../../../api/account/my/service/unifedi_api_my_account_service.dart';
import '../../../../api/account/my/unifedi_api_my_account_model.dart';
import '../../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../../api/account/unifedi_api_account_model.dart';
import '../../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../../api/status/unifedi_api_status_model.dart';
import '../../../../api/tag/unifedi_api_tag_model.dart';
import '../../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../../featured_tags/unifedi_api_featured_tags_model_mastodon_adapter.dart';
import '../../../field/unifedi_api_field_model_mastodon_adapter.dart';
import '../../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../../service/unifedi_api_service_mastodon_adapter.dart';
import '../../../status/unifedi_api_status_model_mastodon_adapter.dart';
import '../../../tag/unifedi_api_tag_model_mastodon_adapter.dart';
import '../../relationship/unifedi_api_account_relationship_model_mastodon_adapter.dart';
import '../../unifedi_api_account_model_mastodon_adapter.dart';
import '../unifedi_api_my_account_model_mastodon_adapter.dart';

class UnifediApiMyAccountServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiMyAccountService {
  final IMastodonApiMyAccountUserAccessService
      mastodonApiMyAccountUserAccessService;

  UnifediApiMyAccountServiceMastodonAdapter({
    required this.mastodonApiMyAccountUserAccessService,
  });

  @override
  Future<IUnifediApiAccountRelationship?> acceptMyAccountFollowRequest({
    required String accountId,
  }) =>
      mastodonApiMyAccountUserAccessService
          .acceptMyAccountFollowRequest(
            accountId: accountId,
          )
          .then(
            (value) => value?.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get acceptMyAccountFollowRequestFeature =>
      mastodonApiMyAccountUserAccessService.acceptMyAccountFollowRequestFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiTag> featureMyAccountTag({
    required String name,
  }) =>
      mastodonApiMyAccountUserAccessService
          .featureMyAccountTag(name: name)
          .then(
            (value) => value.toUnifediApiFeaturedTagMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get featureMyAccountTagFeature =>
      mastodonApiMyAccountUserAccessService.featureMyAccountTagFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyAccountBlocks({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyAccountBlocks(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyAccountBlocksFeature =>
      mastodonApiMyAccountUserAccessService.getMyAccountBlocksFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyAccountMutes({
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withRelationship,
      feature: getMyAccountMutesWithRelationshipFeature,
    );

    return mastodonApiMyAccountUserAccessService
        .getMyAccountMutes(
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (value) => value.toUnifediApiAccountMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getMyAccountMutesFeature =>
      mastodonApiMyAccountUserAccessService.getMyAccountMutesFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiStatus>> getMyBookmarks({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyBookmarks(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyBookmarksFeature =>
      mastodonApiMyAccountUserAccessService.getMyBookmarksFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<String>> getMyDomainBlocks({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService.getMyDomainBlocks(
        pagination: pagination?.toMastodonApiPagination(),
      );

  @override
  IUnifediApiFeature get getMyDomainBlocksFeature =>
      mastodonApiMyAccountUserAccessService.getMyDomainBlocksFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyEndorsements({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyEndorsements(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyEndorsementsFeature =>
      mastodonApiMyAccountUserAccessService.getMyEndorsementsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiStatus>> getMyFavourites({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyFavourites(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyFavouritesFeature =>
      mastodonApiMyAccountUserAccessService.getMyFavouritesFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getMyFavouritesPaginationMinIdFeature =>
      mastodonApiMyAccountUserAccessService
          .getMyFavouritesPaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiTag>> getMyAccountFeaturedTags({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyAccountFeaturedTags(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiFeaturedTagMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyAccountFeaturedTagsFeature =>
      mastodonApiMyAccountUserAccessService.getMyAccountFeaturedTagsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMyFollowRequests({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiMyAccountUserAccessService
          .getMyFollowRequests(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMyFollowRequestsFeature =>
      mastodonApiMyAccountUserAccessService.getMyFollowRequestsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiTag>> getMySuggestedTags() =>
      mastodonApiMyAccountUserAccessService.getMySuggestedTags().then(
            (value) => value.toUnifediApiTagMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMySuggestedTagsFeature =>
      mastodonApiMyAccountUserAccessService.getMySuggestedTagsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getMySuggestions({
    required int? limit,
  }) =>
      mastodonApiMyAccountUserAccessService.getMySuggestions(limit: limit).then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getMySuggestionsFeature =>
      mastodonApiMyAccountUserAccessService.getMySuggestionsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship?> rejectMyAccountFollowRequest({
    required String accountId,
  }) =>
      mastodonApiMyAccountUserAccessService
          .rejectMyAccountFollowRequest(
            accountId: accountId,
          )
          .then(
            (value) => value?.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get rejectMyAccountFollowRequestFeature =>
      mastodonApiMyAccountUserAccessService.rejectMyAccountFollowRequestFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> removeMyAccountSuggestion({
    required String accountId,
  }) =>
      mastodonApiMyAccountUserAccessService.removeMyAccountSuggestion(
        accountId: accountId,
      );

  @override
  IUnifediApiFeature get removeMyAccountSuggestionFeature =>
      mastodonApiMyAccountUserAccessService.removeMyAccountSuggestionFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiMyAccountUserAccessService.restService,
      );

  @override
  Future<void> unfeatureMyAccountTag({
    required String tagId,
  }) =>
      mastodonApiMyAccountUserAccessService.unfeatureMyAccountTag(tagId: tagId);

  @override
  IUnifediApiFeature get unfeatureMyAccountTagFeature =>
      mastodonApiMyAccountUserAccessService.unfeatureMyAccountTagFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  // ignore: long-parameter-list, long-method
  Future<IUnifediApiMyAccount> updateMyCredentials({
    required IUnifediApiEditMyAccount editMyAccount,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.noRichText,
      feature: updateMyCredentialsNoRichTextFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.hideFollowers,
      feature: updateMyCredentialsHideFollowersFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.hideFollows,
      feature: updateMyCredentialsHideFollowsFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.hideFollowersCount,
      feature: updateMyCredentialsHideFollowersCountFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.hideFollowsCount,
      feature: updateMyCredentialsHideFollowsCountFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.hideFavorites,
      feature: updateMyCredentialsHideFavoritesFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.showRole,
      feature: updateMyCredentialsShowRoleFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.defaultScope,
      feature: updateMyCredentialsDefaultScopeFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.settingsStore,
      feature: updateMyCredentialsSettingsStoreFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.skipThreadContainment,
      feature: updateMyCredentialsSkipThreadContainmentFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.allowFollowingMove,
      feature: updateMyCredentialsAllowFollowingMoveFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.acceptsChatMessages,
      feature: updateMyCredentialsAcceptsChatMessagesFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: editMyAccount.backgroundImageLocalFilePath,
      feature: updateMyCredentialsBackgroundImageFeature,
    );

    return mastodonApiMyAccountUserAccessService
        .updateMyCredentials(
          editMyAccount: MastodonApiEditMyAccount(
            fieldsAttributes:
                editMyAccount.fieldsAttributes?.toMastodonApiFieldList(),
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
          ),
        )
        .then(
          (value) => value.toUnifediApiMyAccountMastodonAdapter(),
        );
  }

  @override
  IUnifediApiFeature get updateMyCredentialsDiscoverableFeature =>
      mastodonApiMyAccountUserAccessService
          .updateMyCredentialsDiscoverableFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsFeature =>
      mastodonApiMyAccountUserAccessService.updateMyCredentialsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsLockedFeature =>
      mastodonApiMyAccountUserAccessService.updateMyCredentialsLockedFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsPrivacyFeature =>
      mastodonApiMyAccountUserAccessService.updateMyCredentialsPrivacyFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMyCredentialsSensitiveFeature =>
      mastodonApiMyAccountUserAccessService.updateMyCredentialsSensitiveFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiMyAccount> verifyMyCredentials() =>
      mastodonApiMyAccountUserAccessService.verifyMyCredentials().then(
            (value) => value.toUnifediApiMyAccountMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get verifyMyCredentialsFeature =>
      mastodonApiMyAccountUserAccessService.verifyMyCredentialsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature
      get getMyAccountMutesWithRelationshipFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getMyAccountMutesWithRelationshipFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsAcceptsChatMessagesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsAcceptsChatMessagesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsAllowFollowingMoveFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsAllowFollowingMoveFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get updateMyCredentialsAlsoKnownAsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'updateMyCredentialsAlsoKnownAsFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsBackgroundImageFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsBackgroundImageFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsDefaultScopeFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsDefaultScopeFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsHideFavoritesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsHideFavoritesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsHideFollowersCountFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsHideFollowersCountFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsHideFollowersFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsHideFollowersFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsHideFollowsCountFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsHideFollowsCountFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get updateMyCredentialsHideFollowsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'updateMyCredentialsHideFollowsFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get updateMyCredentialsNoRichTextFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'updateMyCredentialsNoRichTextFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsSettingsStoreFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsSettingsStoreFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get updateMyCredentialsShowRoleFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'updateMyCredentialsShowRoleFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get updateMyCredentialsSkipThreadContainmentFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'updateMyCredentialsSkipThreadContainmentFeature',
          );

  @override
  Future<void> editNotificationsSettings({
    required bool? blockFromStrangers,
    required bool? hideNotificationContents,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: editNotificationsSettingsFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get editNotificationsSettingsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'editNotificationsSettingsFeature',
      );
}
