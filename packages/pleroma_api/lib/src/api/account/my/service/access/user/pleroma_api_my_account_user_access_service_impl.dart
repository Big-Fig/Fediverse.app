import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../../featured_tags/pleroma_api_featured_tags_model.dart';
import '../../../../../featured_tags/pleroma_api_featured_tags_model_impl.dart';
import '../../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../../rest/pleroma_api_rest_service.dart';
import '../../../../../service/pleroma_api_service_impl.dart';
import '../../../../../status/pleroma_api_status_model.dart';
import '../../../../../status/pleroma_api_status_model_impl.dart';
import '../../../../../tag/pleroma_api_tag_model.dart';
import '../../../../../tag/pleroma_api_tag_model_impl.dart';
import '../../../../pleroma_api_account_model.dart';
import '../../../../pleroma_api_account_model_impl.dart';
import '../../../../relationship/pleroma_api_account_relationship_model.dart';
import '../../../../relationship/pleroma_api_account_relationship_model_impl.dart';
import '../../../edit/pleroma_api_edit_my_account_model.dart';
import '../../../pleroma_api_my_account_model.dart';
import '../../../pleroma_api_my_account_model_impl.dart';
import 'pleroma_api_my_account_user_access_service.dart';

// ignore_for_file: long-parameter-list

class PleromaApiMyAccountUserAccessService extends PleromaApiService
    implements IPleromaApiMyAccountUserAccessService {
  final MastodonApiMyAccountUserAccessService
      mastodonApiMyAccountUserAccessService;

  PleromaApiMyAccountUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiMyAccountUserAccessService =
            MastodonApiMyAccountUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiMyAccountUserAccessService.disposeWith(this);
  }

  @override
  Future<IPleromaApiAccountRelationship> acceptMyAccountFollowRequest({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: acceptMyAccountFollowRequestFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createacceptMyAccountFollowRequestRequest(accountId: accountId),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get acceptMyAccountFollowRequestFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService
            .acceptMyAccountFollowRequestFeature,
      );

  @override
  Future<IPleromaApiFeaturedTag> featureMyAccountTag({
    required String name,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: acceptMyAccountFollowRequestFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createFeatureMyAccountTagRequest(name: name),
        jsonParser: (json) => PleromaApiFeaturedTag.fromJson(json),
      );

  @override
  IPleromaApiFeature get featureMyAccountTagFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.featureMyAccountTagFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getMyAccountBlocks({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountBlocksFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyAccountBlocksRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyAccountBlocksFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyAccountBlocksFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getMyAccountMutes({
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountMutesFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyAccountMutesRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyAccountMutesFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyAccountMutesFeature,
      );

  @override
  Future<List<IPleromaApiStatus>> getMyBookmarks({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyBookmarksFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyBookmarksRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyBookmarksFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyBookmarksFeature,
      );

  @override
  Future<List<String>> getMyDomainBlocks({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseStringList(
        requestFeature: getMyDomainBlocksFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyDomainBlocksRequest(pagination: pagination),
      );

  @override
  IPleromaApiFeature get getMyDomainBlocksFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyDomainBlocksFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getMyEndorsements({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyEndorsementsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyEndorsementsRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyEndorsementsFeature =>
      // Currently Pleroma based on Mastodon 2.7.2 API,
      // however getMySuggestions introduced in Mastodon 2.5.0 not implemented yet
      PleromaApiFeature.notImplementedYet(
        mastodonApiMyAccountUserAccessService.getMyEndorsementsFeature,
      );

  // PleromaApiFeature.onlyUserRequirements(
  //   mastodonApiMyAccountUserAccessService.getMyEndorsementsFeature,
  // );

  @override
  Future<List<IPleromaApiStatus>> getMyFavourites({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyFavouritesFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getMyFavouritesPaginationMinIdFeature,
        ],
        request: mastodonApiMyAccountUserAccessService
            .createGetMyFavouritesRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyFavouritesFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyFavouritesFeature,
      );

  @override
  IPleromaApiFeature get getMyFavouritesPaginationMinIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService
            .getMyFavouritesPaginationMinIdFeature,
      );

  @override
  Future<List<IPleromaApiFeaturedTag>> getMyAccountFeaturedTags({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountFeaturedTagsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .creategetMyAccountFeaturedTagsRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiFeaturedTag.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyAccountFeaturedTagsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyAccountFeaturedTagsFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getMyFollowRequests({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyFollowRequestsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMyFollowRequestsRequest(pagination: pagination),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMyFollowRequestsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMyFollowRequestsFeature,
      );

  @override
  Future<List<IPleromaApiTag>> getMySuggestedTags() =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMySuggestedTagsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMySuggestedTagsRequest(),
        jsonParser: (json) => PleromaApiTag.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMySuggestedTagsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.getMySuggestedTagsFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getMySuggestions({
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMySuggestionsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createGetMySuggestionsRequest(limit: limit),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMySuggestionsFeature =>
      // Currently Pleroma based on Mastodon 2.7.2 API,
      // however getMySuggestions introduced in Mastodon 2.4.3 not implemented yet
      PleromaApiFeature.notImplementedYet(
        mastodonApiMyAccountUserAccessService.getMySuggestionsFeature,
      );

  // PleromaApiFeature.onlyUserRequirements(
  //   mastodonApiMyAccountUserAccessService.getMySuggestionsFeature,
  // );

  @override
  Future<IPleromaApiAccountRelationship> rejectMyAccountFollowRequest({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: rejectMyAccountFollowRequestFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createrejectMyAccountFollowRequestRequest(accountId: accountId),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get rejectMyAccountFollowRequestFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService
            .rejectMyAccountFollowRequestFeature,
      );

  @override
  Future<void> removeMyAccountSuggestion({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unfeatureMyAccountTagFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createRemoveMyAccountSuggestionRequest(
          accountId: accountId,
        ),
      );

  @override
  IPleromaApiFeature get removeMyAccountSuggestionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.removeMyAccountSuggestionFeature,
      );

  @override
  Future<void> unfeatureMyAccountTag({
    required String tagId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unfeatureMyAccountTagFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createUnfeatureMyAccountTagRequest(tagId: tagId),
      );

  @override
  IPleromaApiFeature get unfeatureMyAccountTagFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.unfeatureMyAccountTagFeature,
      );

  @override
  // ignore: long-method
  Future<IPleromaApiMyAccount> updateMyCredentials({
    required IPleromaApiEditMyAccount editMyAccount,
  }) {
    var pleromaBackgroundImageLocalFilePath =
        editMyAccount.pleromaBackgroundImageLocalFilePath;
    assert(
      !(pleromaBackgroundImageLocalFilePath != null &&
          editMyAccount.deletePleromaBackgroundImage == true),
      "Can't set and delete in one time",
    );

    // TODO(xal): report or fix, https://github.com/xal/dart_fediverse_api/issues/2
    // separate files and non-files update
    // because multipart update with fields and fields fails
    var request = mastodonApiMyAccountUserAccessService
        .createUpdateMyCredentialsRequest(
      editMyAccount: editMyAccount,
    )
        .copyAndAppend(
      bodyJson: <String, dynamic>{
        if (editMyAccount.noRichText != null)
          'no_rich_text': editMyAccount.noRichText,
        if (editMyAccount.hideFollowers != null)
          'hide_followers': editMyAccount.hideFollowers,
        if (editMyAccount.hideFollows != null)
          'hide_follows': editMyAccount.hideFollows,
        if (editMyAccount.hideFollowersCount != null)
          'hide_followers_count': editMyAccount.hideFollowersCount,
        if (editMyAccount.hideFollowsCount != null)
          'hide_follows_count': editMyAccount.hideFollowsCount,
        if (editMyAccount.hideFavorites != null)
          'hide_favorites': editMyAccount.hideFavorites,
        if (editMyAccount.showRole != null) 'show_role': editMyAccount.showRole,
        if (editMyAccount.defaultScope != null)
          'default_scope': editMyAccount.defaultScope,
        if (editMyAccount.pleromaSettingsStore != null)
          'pleroma_settings_store': editMyAccount.pleromaSettingsStore,
        if (editMyAccount.skipThreadContainment != null)
          'skip_thread_containment': editMyAccount.skipThreadContainment,
        if (editMyAccount.allowFollowingMove != null)
          'allow_following_move': editMyAccount.allowFollowingMove,
        if (editMyAccount.acceptsChatMessages != null)
          'accepts_chat_messages': editMyAccount.acceptsChatMessages,
        if (editMyAccount.alsoKnownAs != null)
          'also_known_as': editMyAccount.alsoKnownAs,
        if (editMyAccount.deletePleromaBackgroundImage == true)
          'pleroma_background_image': '',
      },
      files: {
        if (pleromaBackgroundImageLocalFilePath != null)
          'pleroma_background_image': File(
            pleromaBackgroundImageLocalFilePath,
          ),
      },
    );

    // backend fails if update fields and fields in one request
    if (request.files?.isNotEmpty == true) {
      // we don't want to parse result
      // because non 2xx response will cause exception
      // ignore: avoid-ignoring-return-values
      restService.sendHttpRequestAndParseJson(
        requestFeature: updateMyCredentialsFeature,
        fieldFeatures: [
          if (editMyAccount.discoverable != null)
            updateMyCredentialsDiscoverableFeature,
          if (editMyAccount.locked != null) updateMyCredentialsLockedFeature,
          if (editMyAccount.sensitive != null)
            updateMyCredentialsSensitiveFeature,
          if (editMyAccount.privacy != null) updateMyCredentialsPrivacyFeature,
        ],
        request: RestRequest(
          type: request.type,
          relativeUrlPath: request.relativeUrlPath,
          queryArgs: request.queryArgs,
          bodyJson: null,
          headers: request.headers,
          files: request.files,
        ),
        jsonParser: (json) => PleromaApiMyAccount.fromJson(json),
      );
    }

    return restService.sendHttpRequestAndParseJson(
      requestFeature: updateMyCredentialsFeature,
      fieldFeatures: [
        if (editMyAccount.discoverable != null)
          updateMyCredentialsDiscoverableFeature,
        if (editMyAccount.locked != null) updateMyCredentialsLockedFeature,
        if (editMyAccount.sensitive != null)
          updateMyCredentialsSensitiveFeature,
        if (editMyAccount.privacy != null) updateMyCredentialsPrivacyFeature,
      ],
      request: RestRequest(
        type: request.type,
        relativeUrlPath: request.relativeUrlPath,
        queryArgs: request.queryArgs,
        bodyJson: request.bodyJson,
        headers: request.headers,
        files: null,
      ),
      jsonParser: (json) => PleromaApiMyAccount.fromJson(json),
    );
  }

  @override
  IPleromaApiFeature get updateMyCredentialsDiscoverableFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService
            .updateMyCredentialsDiscoverableFeature,
      );

  @override
  IPleromaApiFeature get updateMyCredentialsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.updateMyCredentialsFeature,
      );

  @override
  IPleromaApiFeature get updateMyCredentialsLockedFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.updateMyCredentialsLockedFeature,
      );

  @override
  IPleromaApiFeature get updateMyCredentialsPrivacyFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.updateMyCredentialsPrivacyFeature,
      );

  @override
  IPleromaApiFeature get updateMyCredentialsSensitiveFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService
            .updateMyCredentialsSensitiveFeature,
      );

  @override
  Future<IPleromaApiMyAccount> verifyMyCredentials() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: verifyMyCredentialsFeature,
        fieldFeatures: null,
        request: mastodonApiMyAccountUserAccessService
            .createVerifyMyCredentialsRequest(),
        jsonParser: (json) => PleromaApiMyAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get verifyMyCredentialsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMyAccountUserAccessService.verifyMyCredentialsFeature,
      );

  @override
  Future<void> editNotificationsSettings({
    required bool? blockFromStrangers,
    required bool? hideNotificationContents,
  }) {
    var bodyJson = {
      if (blockFromStrangers != null)
        'block_from_strangers': blockFromStrangers,
      if (hideNotificationContents != null)
        'hide_notification_contents': blockFromStrangers,
    };

    assert(bodyJson.isNotEmpty, 'At least one arg is required');

    // 200 response -  {"status": "success"}
    // I don't think parsing non-informative response is required
    // handle status code is enough
    return restService.sendHttpRequestAndProcessEmpty(
      requestFeature: editNotificationsSettingsFeature,
      fieldFeatures: null,
      request: RestRequest.put(
        relativePath: '/api/pleroma/notification_settings',
        bodyJson: bodyJson,
      ),
    );
  }

  @override
  IPleromaApiFeature get editNotificationsSettingsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );
}
