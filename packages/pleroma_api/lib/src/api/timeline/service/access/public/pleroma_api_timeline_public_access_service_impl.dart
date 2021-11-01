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
import '../../../../visibility/reply_filter/pleroma_api_timeline_reply_visibility_filter_model.dart';
import 'pleroma_api_timeline_public_access_service.dart';

class PleromaApiTimelinePublicAccessService extends PleromaApiService
    implements IPleromaApiTimelinePublicAccessService {
  final MastodonApiTimelinePublicAccessService
      mastodonApiTimelinePublicAccessService;

  PleromaApiTimelinePublicAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiTimelinePublicAccessService =
            MastodonApiTimelinePublicAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiTimelinePublicAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IPleromaApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'tag/$hashtag',
        pagination: pagination,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        replyVisibilityFilter: null,
        onlyFromInstance: null,
        onlyRemote: null,
        requestFeature: getHashtagTimelineFeature,
        fieldFeatures: [
          if (onlyWithMedia != null) getHashtagTimelineOnlyMediaFeature,
          if (pagination?.minId != null)
            getHashtagTimelinePaginationMinIdFeature,
        ],
      );

  @override
  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getPublicTimeline({
    required IPleromaApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? withMuted,
    required String? onlyFromInstance,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? replyVisibilityFilter,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'public',
        pagination: pagination,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        replyVisibilityFilter: replyVisibilityFilter,
        onlyFromInstance: onlyFromInstance,
        onlyRemote: onlyRemote,
        requestFeature: getPublicTimelineFeature,
        fieldFeatures: [
          if (onlyWithMedia != null) getPublicTimelineOnlyMediaFeature,
          if (onlyRemote != null) getPublicTimelineOnlyRemoteFeature,
          if (pagination?.minId != null)
            getPublicTimelinePaginationMinIdFeature,
        ],
      );

  // ignore: long-parameter-list, long-method
  Future<List<IPleromaApiStatus>> getTimeline({
    required String relativeTimeLineUrlPath,
    required IPleromaApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required bool? onlyRemote,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? replyVisibilityFilter,
    required String? onlyFromInstance,
    required IPleromaApiFeature requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
  }) =>
      sendAndProcessPleromaApiStatusResponse(
        request: mastodonApiTimelinePublicAccessService
            .createGetTimelineRequest(
          relativeTimeLineUrlPath: relativeTimeLineUrlPath,
          pagination: pagination,
          onlyWithMedia: onlyWithMedia,
          onlyLocal: onlyLocal,
          onlyRemote: onlyRemote,
        )
            .copyAndAppend(
          queryArgs: [
            if (withMuted != null)
              UrlQueryArg(
                key: 'with_muted',
                value: withMuted.toString(),
              ),
            if (onlyFromInstance != null)
              UrlQueryArg(
                key: 'instance',
                value: onlyFromInstance,
              ),
            if (replyVisibilityFilter != null)
              UrlQueryArg(
                key: 'reply_visibility',
                value: replyVisibilityFilter.stringValue,
              ),
            if (excludeVisibilities != null)
              ...excludeVisibilities.map(
                (visibility) => UrlQueryArg(
                  key: 'exclude_visibilities[]',
                  value: visibility.stringValue,
                ),
              ),
          ],
        ),
        requestFeature: requestFeature,
        fieldFeatures: fieldFeatures,
      );

  Future<List<IPleromaApiStatus>> sendAndProcessPleromaApiStatusResponse({
    required IRestRequest request,
    required IPleromaApiFeature requestFeature,
    required List<IPleromaApiFeature>? fieldFeatures,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request: request,
        requestFeature: requestFeature,
        fieldFeatures: fieldFeatures,
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get getHashtagTimelineFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService.getHashtagTimelineFeature,
      );

  @override
  IPleromaApiFeature get getHashtagTimelineOnlyMediaFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService
            .getHashtagTimelineOnlyMediaFeature,
      );

  @override
  IPleromaApiFeature get getHashtagTimelinePaginationMinIdFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService
            .getHashtagTimelinePaginationMinIdFeature,
      );

  @override
  IPleromaApiFeature get getPublicTimelineFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService.getPublicTimelineFeature,
      );

  @override
  IPleromaApiFeature get getPublicTimelineOnlyMediaFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService
            .getPublicTimelineOnlyMediaFeature,
      );

  @override
  IPleromaApiFeature get getPublicTimelineOnlyRemoteFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService
            .getPublicTimelineOnlyRemoteFeature,
      );

  @override
  IPleromaApiFeature get getPublicTimelinePaginationMinIdFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiTimelinePublicAccessService
            .getPublicTimelinePaginationMinIdFeature,
      );

  @override
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      PleromaApiVisibility.calculatePossibleExcludeVisibilitiesValues();
}
