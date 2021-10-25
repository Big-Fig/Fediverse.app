import 'dart:io';

import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../../access/mastodon_api_access_model.dart';
import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../../featured_tags/mastodon_api_featured_tags_model.dart';
import '../../../../../featured_tags/mastodon_api_featured_tags_model_impl.dart';
import '../../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../../rest/mastodon_api_rest_service.dart';
import '../../../../../service/mastodon_api_service_impl.dart';
import '../../../../../status/mastodon_api_status_model.dart';
import '../../../../../status/mastodon_api_status_model_impl.dart';
import '../../../../../tag/mastodon_api_tag_model.dart';
import '../../../../../tag/mastodon_api_tag_model_impl.dart';
import '../../../../mastodon_api_account_model.dart';
import '../../../../mastodon_api_account_model_impl.dart';
import '../../../../relationship/mastodon_api_account_relationship_model.dart';
import '../../../../relationship/mastodon_api_account_relationship_model_impl.dart';
import '../../../edit/mastodon_api_edit_my_account_model.dart';
import '../../../mastodon_api_my_account_model.dart';
import '../../../mastodon_api_my_account_model_impl.dart';
import 'mastodon_api_my_account_user_access_service.dart';

// ignore_for_file: long-parameter-list

class MastodonApiMyAccountUserAccessService extends MastodonApiService
    implements IMastodonApiMyAccountUserAccessService {
  final favouritesRelativeUrlPath = '/api/v1/favourites';
  final verifyProfileRelativeUrlPath = '/api/v1/accounts/verify_credentials';
  final editProfileRelativeUrlPath = '/api/v1/accounts/update_credentials';
  final endorsementsRelativeUrlPath = '/api/v1/endorsements';

  final featuredTagsRelativeUrlPath = '/api/v1/featured_tags';

  final suggestionsRelativeUrlPath = '/api/v1/suggestions';

  @override
  IMastodonApiFeature get acceptMyAccountFollowRequestFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFollowsOrFollow,
      );

  @override
  IMastodonApiFeature get featureMyAccountTagFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get getMyAccountBlocksFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readBlocks,
      );

  @override
  IMastodonApiFeature get getMyAccountMutesFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readMutesOrFollow,
      );

  @override
  IMastodonApiFeature get getMyBookmarksFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readBookmarks,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );

  @override
  IMastodonApiFeature get getMyDomainBlocksFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readBlocks,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast1_4_0,
      );

  @override
  IMastodonApiFeature get getMyEndorsementsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_5_0,
      );

  @override
  IMastodonApiFeature get getMyAccountFeaturedTagsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get getMyFollowRequestsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readFollowsOrFollow,
      );

  @override
  IMastodonApiFeature get getMySuggestedTagsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get getMySuggestionsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get rejectMyAccountFollowRequestFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFollowsOrFollow,
      );

  @override
  IMastodonApiFeature get removeMyAccountSuggestionFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get unfeatureMyAccountTagFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get updateMyCredentialsDiscoverableFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  IMastodonApiFeature get updateMyCredentialsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast1_1_1,
      );

  @override
  IMastodonApiFeature get updateMyCredentialsLockedFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_3_0,
      );

  @override
  IMastodonApiFeature get updateMyCredentialsPrivacyFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );

  @override
  IMastodonApiFeature get updateMyCredentialsSensitiveFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );

  @override
  IMastodonApiFeature get verifyMyCredentialsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
      );

  @override
  MastodonApiFeature get getMyFavouritesFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readFavourites,
      );

  @override
  MastodonApiFeature get getMyFavouritesPaginationMinIdFeature =>
      getMyFavouritesFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  MastodonApiMyAccountUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  // ignore: long-method
  Future<IMastodonApiMyAccount> updateMyCredentials({
    required IMastodonApiEditMyAccount editMyAccount,
  }) {
    // TODO(xal): report or fix, https://github.com/xal/dart_fediverse_api/issues/2
    // separate files and non-files update
    // because multipart update with fields and fields fails
    var request = createUpdateMyCredentialsRequest(
      editMyAccount: editMyAccount,
    );

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
        jsonParser: (json) => MastodonApiMyAccount.fromJson(json),
      );
    }

    return restService.sendHttpRequestAndParseJson(
      requestFeature: updateMyCredentialsFeature,
      fieldFeatures: createUpdateMyCredentialsFieldFeatures(
        editMyAccount: editMyAccount,
      ),
      request: RestRequest(
        type: request.type,
        relativeUrlPath: request.relativeUrlPath,
        queryArgs: request.queryArgs,
        bodyJson: request.bodyJson,
        headers: request.headers,
        files: null,
      ),
      jsonParser: (json) => MastodonApiMyAccount.fromJson(json),
    );
  }

  List<IMastodonApiFeature>? createUpdateMyCredentialsFieldFeatures({
    required IMastodonApiEditMyAccount editMyAccount,
  }) =>
      [
        if (editMyAccount.discoverable != null)
          updateMyCredentialsDiscoverableFeature,
        if (editMyAccount.locked != null) updateMyCredentialsLockedFeature,
        if (editMyAccount.sensitive != null)
          updateMyCredentialsSensitiveFeature,
        if (editMyAccount.privacy != null) updateMyCredentialsPrivacyFeature,
      ];

  // ignore: long-method
  RestRequest createUpdateMyCredentialsRequest({
    required IMastodonApiEditMyAccount editMyAccount,
  }) {
    var avatarLocalFilePath = editMyAccount.avatarLocalFilePath;
    assert(
      !(avatarLocalFilePath != null && editMyAccount.deleteAvatar == true),
      "Can't set and delete in one time",
    );
    var headerLocalFilePath = editMyAccount.headerLocalFilePath;
    assert(
      !(headerLocalFilePath != null && editMyAccount.deleteHeader == true),
      "Can't set and delete in one time",
    );
    var fieldsAttributes = editMyAccount.fieldsAttributes;

    Map<String, Map<String, dynamic>>? fieldsAttributesJson;
    if (fieldsAttributes != null && fieldsAttributes.isNotEmpty) {
      fieldsAttributesJson = {};

      fieldsAttributes.asMap().forEach(
        (index, item) {
          // ignore: avoid-non-null-assertion
          fieldsAttributesJson![index.toString()] = item.toJson();
        },
      );
    }

    return RestRequest.patch(
      relativePath: editProfileRelativeUrlPath,
      bodyJson: <String, dynamic>{
        if (fieldsAttributes != null) 'fields_attributes': fieldsAttributesJson,
        if (editMyAccount.discoverable != null)
          'discoverable': editMyAccount.discoverable,
        if (editMyAccount.bot != null) 'bot': editMyAccount.bot,
        if (editMyAccount.displayName != null)
          'display_name': editMyAccount.displayName,
        if (editMyAccount.note != null) 'note': editMyAccount.note,
        if (editMyAccount.locked != null) 'locked': editMyAccount.locked,
        if (editMyAccount.privacy != null ||
            editMyAccount.sensitive != null ||
            editMyAccount.language != null)
          'source': {
            if (editMyAccount.privacy != null) 'privacy': editMyAccount.privacy,
            if (editMyAccount.sensitive != null)
              'sensitive': editMyAccount.sensitive,
            if (editMyAccount.language != null)
              'language': editMyAccount.language,
          },
        if (editMyAccount.deleteAvatar == true) 'avatar': '',
        if (editMyAccount.deleteHeader == true) 'header': '',
      },
      files: {
        if (headerLocalFilePath != null) 'header': File(headerLocalFilePath),
        if (avatarLocalFilePath != null) 'avatar': File(avatarLocalFilePath),
      },
    );
  }

  @override
  Future<IMastodonApiMyAccount> verifyMyCredentials() =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: verifyMyCredentialsFeature,
        fieldFeatures: createVerifyMyCredentialsFieldFeatures(),
        request: createVerifyMyCredentialsRequest(),
        jsonParser: (json) => MastodonApiMyAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createVerifyMyCredentialsFieldFeatures() => null;

  RestRequest createVerifyMyCredentialsRequest() => RestRequest.get(
        relativePath: verifyProfileRelativeUrlPath,
      );

  @override
  Future<List<IMastodonApiStatus>> getMyBookmarks({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyBookmarksFeature,
        fieldFeatures: createGetMyBookmarksFieldFeatures(),
        request: createGetMyBookmarksRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createGetMyBookmarksRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: 'api/v1/bookmarks',
        queryArgs: pagination?.toQueryArgs(),
      );

  List<IMastodonApiFeature>? createGetMyBookmarksFieldFeatures() => null;

  @override
  Future<List<IMastodonApiAccount>> getMyFollowRequests({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyFollowRequestsFeature,
        fieldFeatures: createGetMyFollowRequestsFieldFeatures(),
        request: createGetMyFollowRequestsRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMyFollowRequestsFieldFeatures() => null;

  RestRequest createGetMyFollowRequestsRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: 'api/v1/follow_requests',
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<IMastodonApiAccountRelationship?> acceptMyAccountFollowRequest({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: acceptMyAccountFollowRequestFeature,
        fieldFeatures: createacceptMyAccountFollowRequestFieldFeatures(),
        request:
            createacceptMyAccountFollowRequestRequest(accountId: accountId),
        jsonParser: MastodonApiAccountRelationship.fromJsonOrNullOnError,
      );

  List<IMastodonApiFeature>?
      createacceptMyAccountFollowRequestFieldFeatures() => null;

  RestRequest createacceptMyAccountFollowRequestRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            'api/v1/follow_requests',
            accountId,
            'authorize',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship?> rejectMyAccountFollowRequest({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: rejectMyAccountFollowRequestFeature,
        fieldFeatures: createrejectMyAccountFollowRequestFieldFeatures(),
        request: createrejectMyAccountFollowRequestRequest(
          accountId: accountId,
        ),
        jsonParser: MastodonApiAccountRelationship.fromJsonOrNullOnError,
      );

  List<IMastodonApiFeature>?
      createrejectMyAccountFollowRequestFieldFeatures() => null;

  RestRequest createrejectMyAccountFollowRequestRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join([
          'api/v1/follow_requests',
          accountId,
          'reject',
        ]),
      );

  @override
  Future<List<String>> getMyDomainBlocks({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseStringList(
        requestFeature: getMyDomainBlocksFeature,
        fieldFeatures: createGetMyDomainBlocksFieldFeatures(),
        request: createGetMyDomainBlocksRequest(
          pagination: pagination,
        ),
      );

  List<IMastodonApiFeature>? createGetMyDomainBlocksFieldFeatures() => null;

  RestRequest createGetMyDomainBlocksRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: 'api/v1/domain_blocks',
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<List<IMastodonApiAccount>> getMyAccountBlocks({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountBlocksFeature,
        fieldFeatures: createGetMyAccountBlocksFieldFeatures(),
        request: createGetMyAccountBlocksRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMyAccountBlocksFieldFeatures() => null;

  RestRequest createGetMyAccountBlocksRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: 'api/v1/blocks',
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<List<IMastodonApiAccount>> getMyAccountMutes({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountMutesFeature,
        fieldFeatures: createGetMyAccountMutesFieldFeatures(),
        request: createGetMyAccountMutesRequest(pagination: pagination),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMyAccountMutesFieldFeatures() => null;

  RestRequest createGetMyAccountMutesRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: 'api/v1/mutes',
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<List<IMastodonApiAccount>> getMyEndorsements({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyEndorsementsFeature,
        fieldFeatures: createGetMyEndorsementsFieldFeatures(),
        request: createGetMyEndorsementsRequest(pagination: pagination),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMyEndorsementsFieldFeatures() => null;

  RestRequest createGetMyEndorsementsRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: endorsementsRelativeUrlPath,
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<List<IMastodonApiFeaturedTag>> getMyAccountFeaturedTags({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyAccountFeaturedTagsFeature,
        fieldFeatures: creategetMyAccountFeaturedTagsFieldFeatures(),
        request: creategetMyAccountFeaturedTagsRequest(pagination: pagination),
        jsonParser: (json) => MastodonApiFeaturedTag.fromJson(json),
      );

  List<IMastodonApiFeature>? creategetMyAccountFeaturedTagsFieldFeatures() =>
      null;

  RestRequest creategetMyAccountFeaturedTagsRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: featuredTagsRelativeUrlPath,
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<List<IMastodonApiTag>> getMySuggestedTags() =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMySuggestedTagsFeature,
        fieldFeatures: createGetMySuggestedTagsFieldFeatures(),
        request: createGetMySuggestedTagsRequest(),
        jsonParser: (json) => MastodonApiTag.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMySuggestedTagsFieldFeatures() => null;

  RestRequest createGetMySuggestedTagsRequest() => RestRequest.get(
        relativePath: UrlPathHelper.join([
          featuredTagsRelativeUrlPath,
          'suggestions',
        ]),
      );

  @override
  Future<IMastodonApiFeaturedTag> featureMyAccountTag({
    required String name,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: featureMyAccountTagFeature,
        fieldFeatures: createFeatureMyAccountTagFieldFeatures(),
        request: createFeatureMyAccountTagRequest(name: name),
        jsonParser: (json) => MastodonApiFeaturedTag.fromJson(json),
      );

  List<IMastodonApiFeature>? createFeatureMyAccountTagFieldFeatures() => null;

  RestRequest createFeatureMyAccountTagRequest({
    required String name,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join([
          featuredTagsRelativeUrlPath,
        ]),
        bodyJson: <String, dynamic>{
          'name': name,
        },
      );

  @override
  Future<void> unfeatureMyAccountTag({
    required String tagId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unfeatureMyAccountTagFeature,
        fieldFeatures: createUnfeatureMyAccountTagFieldFeatures(),
        request: createUnfeatureMyAccountTagRequest(tagId: tagId),
        jsonParser: (json) => MastodonApiFeaturedTag.fromJson(json),
      );

  List<IMastodonApiFeature>? createUnfeatureMyAccountTagFieldFeatures() => null;

  RestRequest createUnfeatureMyAccountTagRequest({
    required String tagId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join([
          featuredTagsRelativeUrlPath,
          tagId,
        ]),
      );

  @override
  Future<List<IMastodonApiAccount>> getMySuggestions({
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMySuggestionsFeature,
        fieldFeatures: createGetMySuggestionsFieldFeatures(),
        request: createGetMySuggestionsRequest(limit: limit),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetMySuggestionsFieldFeatures() => null;

  RestRequest createGetMySuggestionsRequest({
    required int? limit,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join([
          suggestionsRelativeUrlPath,
        ]),
        queryArgs: [
          if (limit != null)
            UrlQueryArg(
              key: 'limit',
              value: limit.toString(),
            ),
        ],
      );

  @override
  Future<void> removeMyAccountSuggestion({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: removeMyAccountSuggestionFeature,
        fieldFeatures: createRemoveMyAccountSuggestionFieldFeatures(),
        request: createRemoveMyAccountSuggestionRequest(
          accountId: accountId,
        ),
      );

  List<IMastodonApiFeature>? createRemoveMyAccountSuggestionFieldFeatures() =>
      null;

  RestRequest createRemoveMyAccountSuggestionRequest({
    required String accountId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            suggestionsRelativeUrlPath,
            accountId,
          ],
        ),
      );

  @override
  Future<List<MastodonApiStatus>> getMyFavourites({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getMyFavouritesFeature,
        fieldFeatures: createGetMyFavouritesFieldFeatures(
          pagination: pagination,
        ),
        request: createGetMyFavouritesRequest(pagination: pagination),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  List<IMastodonApiFeature<IMastodonApiAccess>>
      createGetMyFavouritesFieldFeatures({
    required IMastodonApiPagination? pagination,
  }) =>
          [
            if (pagination?.minId != null)
              getMyFavouritesPaginationMinIdFeature,
          ];

  RestRequest createGetMyFavouritesRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            favouritesRelativeUrlPath,
          ],
        ),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );
}
