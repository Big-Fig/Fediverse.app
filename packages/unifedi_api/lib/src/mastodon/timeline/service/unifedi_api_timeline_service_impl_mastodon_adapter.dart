import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/timeline/service/unifedi_api_timeline_service.dart';
import '../../../api/visibility/reply_filter/unifedi_api_timeline_reply_visibility_filter_model.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../../status/unifedi_api_status_model_mastodon_adapter.dart';

class UnifediApiTimelineServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiTimelineService {
  final IMastodonApiTimelineUserAccessService
      mastodonApiTimelineUserAccessService;

  UnifediApiTimelineServiceMastodonAdapter({
    required this.mastodonApiTimelineUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiTimelineUserAccessService.restService,
      );

  @override
  Future<List<IUnifediApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IUnifediApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withMuted,
      feature: getHashtagTimelineWithMutedFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getHashtagTimelineExcludeVisibilitiesFeature,
    );

    return mastodonApiTimelineUserAccessService
        .getHashtagTimeline(
          hashtag: hashtag,
          pagination: pagination?.toMastodonApiPagination(),
          onlyWithMedia: onlyWithMedia,
          onlyLocal: onlyLocal,
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getHashtagTimelineFeature =>
      mastodonApiTimelineUserAccessService.getHashtagTimelineFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getHashtagTimelineOnlyMediaFeature =>
      mastodonApiTimelineUserAccessService.getHashtagTimelineOnlyMediaFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getHashtagTimelinePaginationMinIdFeature =>
      mastodonApiTimelineUserAccessService
          .getHashtagTimelinePaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiStatus>> getHomeTimeline({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withMuted,
      feature: getHomeTimelineWithMutedFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getHomeTimelineExcludeVisibilitiesFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: replyVisibilityFilter,
      feature: getHomeTimelineReplyVisibilityFilterFeature,
    );

    return mastodonApiTimelineUserAccessService
        .getHomeTimeline(
          pagination: pagination?.toMastodonApiPagination(),
          onlyLocal: onlyLocal,
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getHomeTimelineFeature =>
      mastodonApiTimelineUserAccessService.getHomeTimelineFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getHomeTimelinePaginationMinIdFeature =>
      mastodonApiTimelineUserAccessService.getHomeTimelinePaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiStatus>> getListTimeline({
    required String listId,
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withMuted,
      feature: getListTimelineWithMutedFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getListTimelineExcludeVisibilitiesFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: onlyLocal,
      feature: getListTimelineOnlyLocalFilterFeature,
    );

    return mastodonApiTimelineUserAccessService
        .getListTimeline(
          listId: listId,
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getListTimelineFeature =>
      mastodonApiTimelineUserAccessService.getListTimelineFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getListTimelinePaginationMinIdFeature =>
      mastodonApiTimelineUserAccessService.getListTimelinePaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  // ignore: long-parameter-list
  Future<List<IUnifediApiStatus>> getPublicTimeline({
    required IUnifediApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? withMuted,
    required String? onlyFromInstance,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withMuted,
      feature: getPublicTimelineWithMutedFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getPublicTimelineExcludeVisibilitiesFeature,
    );

    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: replyVisibilityFilter,
      feature: getPublicTimelineReplyVisibilityFilterFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: onlyFromInstance,
      feature: getPublicTimelineOnlyFromInstanceFeature,
    );

    return mastodonApiTimelineUserAccessService
        .getPublicTimeline(
          pagination: pagination?.toMastodonApiPagination(),
          onlyWithMedia: onlyWithMedia,
          onlyLocal: onlyLocal,
          onlyRemote: onlyRemote,
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getPublicTimelineFeature =>
      mastodonApiTimelineUserAccessService.getPublicTimelineFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getPublicTimelineOnlyMediaFeature =>
      mastodonApiTimelineUserAccessService.getPublicTimelineOnlyMediaFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getPublicTimelineOnlyRemoteFeature =>
      mastodonApiTimelineUserAccessService.getPublicTimelineOnlyRemoteFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getPublicTimelinePaginationMinIdFeature =>
      mastodonApiTimelineUserAccessService
          .getPublicTimelinePaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature
      get getHashtagTimelineExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getHashtagTimelineExcludeVisibilitiesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get getHashtagTimelineWithMutedFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getHashtagTimelineWithMutedFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get getHomeTimelineExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getHomeTimelineExcludeVisibilitiesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get getHomeTimelineReplyVisibilityFilterFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getHomeTimelineReplyVisibilityFilterFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get getHomeTimelineWithMutedFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getHomeTimelineWithMutedFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get getListTimelineExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getListTimelineExcludeVisibilitiesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get getListTimelineOnlyLocalFilterFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getListTimelineOnlyLocalFilterFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get getListTimelineWithMutedFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getListTimelineWithMutedFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get getPublicTimelineExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getPublicTimelineExcludeVisibilitiesFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get getPublicTimelineOnlyFromInstanceFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getPublicTimelineOnlyFromInstanceFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get getPublicTimelineReplyVisibilityFilterFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getPublicTimelineReplyVisibilityFilterFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get getPublicTimelineWithMutedFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getPublicTimelineWithMutedFeature',
      );

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() {
    throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
      feature: getPublicTimelineExcludeVisibilitiesFeature,
    );
  }
}
