import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../status/pleroma_api_status_model_impl.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../pleroma_api_account_model.dart';
import '../../../pleroma_api_account_model_impl.dart';
import 'pleroma_api_account_public_access_service.dart';

class PleromaApiAccountPublicAccessService extends PleromaApiService
    implements IPleromaApiAccountPublicAccessService {
  static const pleromaAccountRelativeUrlPath = '/api/v1/pleroma/accounts/';
  static const withRelationshipRequestBodyKey = 'with_relationship';
  static const withMutedRequestBodyKey = 'with_muted';
  static const excludeVisibilitiesBodyKey = 'exclude_visibilities[]';

  final MastodonApiAccountPublicAccessService
      mastodonApiAccountPublicAccessService;

  PleromaApiAccountPublicAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiAccountPublicAccessService =
            MastodonApiAccountPublicAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiAccountPublicAccessService.disposeWith(this);
  }

  @override
  IPleromaApiFeature get getAccountStatusesExcludeReblogsFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiAccountPublicAccessService
            .getAccountStatusesExcludeReblogsFeature,
      );

  @override
  IPleromaApiFeature get getAccountStatusesFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiAccountPublicAccessService.getAccountStatusesFeature,
      );

  @override
  IPleromaApiFeature get getAccountStatusesPaginationMinIdFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiAccountPublicAccessService
            .getAccountStatusesPaginationMinIdFeature,
      );

  @override
  IPleromaApiFeature get getAccountStatusesTaggedFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiAccountPublicAccessService.getAccountStatusesTaggedFeature,
      );

  @override
  IPleromaApiFeature get getAccountFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiAccountPublicAccessService.getAccountFeature,
      );

  @override
  IPleromaApiFeature get getAccountFavouritedStatusesFeature =>
      PleromaApiFeature.onlyPublicRequirements(null);

  @override
  Future<IPleromaApiAccount> getAccount({
    required String accountId,
    required bool? withRelationship,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountPublicAccessService
            .createGetAccountRequest(
          accountId: accountId,
        )
            .copyAndAppend(
          queryArgs: [
            if (withRelationship != null)
              UrlQueryArg(
                key: withRelationshipRequestBodyKey,
                value: withRelationship.toString(),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  Future<List<IPleromaApiStatus>> getAccountFavouritedStatuses({
    required String accountId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountFavouritedStatusesFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaAccountRelativeUrlPath,
              accountId,
              'favourites',
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getAccountStatuses({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required bool? withMuted,
    required bool? onlyWithMedia,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountStatusesFeature,
        fieldFeatures: [
          if (excludeReblogs != null) getAccountStatusesExcludeReblogsFeature,
          if (tagged != null) getAccountStatusesTaggedFeature,
          if (pagination?.minId != null)
            getAccountStatusesPaginationMinIdFeature,
        ],
        request: mastodonApiAccountPublicAccessService
            .createGetAccountStatusesRequest(
          accountId: accountId,
          tagged: tagged,
          pinned: pinned,
          excludeReplies: excludeReplies,
          excludeReblogs: excludeReblogs,
          onlyWithMedia: onlyWithMedia,
          pagination: pagination,
        )
            .copyAndAppend(
          queryArgs: [
            if (withMuted != null)
              UrlQueryArg(
                key: withMutedRequestBodyKey,
                value: withMuted.toString(),
              ),
            if (excludeVisibilities != null)
              ...excludeVisibilities.map(
                (visibility) => UrlQueryArg(
                  key: excludeVisibilitiesBodyKey,
                  value: visibility.stringValue,
                ),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );
}
