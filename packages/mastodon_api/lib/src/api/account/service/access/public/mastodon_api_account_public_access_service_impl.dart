import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../access/mastodon_api_access_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../../status/mastodon_api_status_model.dart';
import '../../../../status/mastodon_api_status_model_impl.dart';
import '../../../mastodon_api_account_model.dart';
import '../../../mastodon_api_account_model_impl.dart';
import 'mastodon_api_account_public_access_service.dart';

class MastodonApiAccountPublicAccessService extends MastodonApiService
    implements IMastodonApiAccountPublicAccessService {
  final String accountRelativeUrlPath = '/api/v1/accounts/';

  @override
  IMastodonApiFeature<IMastodonApiAccess> get getAccountFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature<IMastodonApiAccess> get getAccountStatusesFeature =>
      MastodonApiFeature.onlyPublicRequirements;

  @override
  IMastodonApiFeature<IMastodonApiAccess>
      get getAccountStatusesExcludeReblogsFeature =>
          MastodonApiFeature.onlyPublicRequirements.copyWith(
            instanceVersionRequirement:
                MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
          );

  @override
  IMastodonApiFeature<IMastodonApiAccess>
      get getAccountStatusesPaginationMinIdFeature =>
          MastodonApiFeature.onlyPublicRequirements.copyWith(
            instanceVersionRequirement:
                MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
          );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get getAccountStatusesTaggedFeature =>
      MastodonApiFeature.onlyPublicRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  MastodonApiAccountPublicAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<IMastodonApiAccount> getAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getAccountFeature,
        fieldFeatures: createGetAccountFieldFeatures(),
        request: createGetAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetAccountFieldFeatures() => null;

  RestRequest createGetAccountRequest({
    required String accountId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
          ],
        ),
      );

  @override
  // ignore: long-parameter-list
  Future<List<IMastodonApiStatus>> getAccountStatuses({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required bool? onlyWithMedia,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountStatusesFeature,
        fieldFeatures: createGetAccountStatusesFieldFeatures(
          excludeReblogs: excludeReblogs,
          tagged: tagged,
          pagination: pagination,
        ),
        request: createGetAccountStatusesRequest(
          accountId: accountId,
          tagged: tagged,
          pinned: pinned,
          excludeReplies: excludeReplies,
          excludeReblogs: excludeReblogs,
          onlyWithMedia: onlyWithMedia,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  List<IMastodonApiFeature<IMastodonApiAccess>>
      createGetAccountStatusesFieldFeatures({
    required bool? excludeReblogs,
    required String? tagged,
    required IMastodonApiPagination? pagination,
  }) =>
          [
            if (excludeReblogs != null) getAccountStatusesExcludeReblogsFeature,
            if (tagged != null) getAccountStatusesTaggedFeature,
            if (pagination?.minId != null)
              getAccountStatusesPaginationMinIdFeature,
          ];

  // ignore: long-parameter-list
  RestRequest createGetAccountStatusesRequest({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required bool? onlyWithMedia,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join([
          accountRelativeUrlPath,
          accountId,
          'statuses',
        ]),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
          if (pinned != null && pinned)
            UrlQueryArg(
              key: 'pinned',
              value: pinned.toString(),
            ),
          if (tagged != null && tagged.isNotEmpty)
            UrlQueryArg(
              key: 'tagged',
              value: tagged,
            ),
          if (excludeReplies != null && excludeReplies)
            UrlQueryArg(
              key: 'exclude_replies',
              value: excludeReplies.toString(),
            ),
          if (excludeReblogs != null && excludeReblogs)
            UrlQueryArg(
              key: 'exclude_reblogs',
              value: excludeReblogs.toString(),
            ),
          if (onlyWithMedia != null && onlyWithMedia)
            UrlQueryArg(
              key: 'only_media',
              value: onlyWithMedia.toString(),
            ),
        ],
      );
}
