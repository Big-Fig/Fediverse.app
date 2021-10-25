import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/timeline/service/unifedi_api_timeline_service.dart';
import '../../../api/visibility/reply_filter/unifedi_api_timeline_reply_visibility_filter_model.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../../visibility/reply_filter/unifedi_api_reply_visibility_filter_sealed_pleroma_converter.dart';
import '../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';

class UnifediApiTimelineServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiTimelineService {
  final IPleromaApiTimelineUserAccessService
      pleromaApiTimelineUserAccessService;

  UnifediApiTimelineServicePleromaAdapter({
    required this.pleromaApiTimelineUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiTimelineUserAccessService.restService,
      );

  @override
  Future<List<IUnifediApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IUnifediApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) =>
      pleromaApiTimelineUserAccessService
          .getHashtagTimeline(
            hashtag: hashtag,
            pagination: pagination?.toPleromaApiPagination(),
            onlyWithMedia: onlyWithMedia,
            onlyLocal: onlyLocal,
            withMuted: withMuted,
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getHashtagTimelineFeature =>
      pleromaApiTimelineUserAccessService.getHashtagTimelineFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getHashtagTimelineOnlyMediaFeature =>
      pleromaApiTimelineUserAccessService.getHashtagTimelineOnlyMediaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getHashtagTimelinePaginationMinIdFeature =>
      pleromaApiTimelineUserAccessService
          .getHashtagTimelinePaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiStatus>> getHomeTimeline({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  }) =>
      pleromaApiTimelineUserAccessService
          .getHomeTimeline(
            pagination: pagination?.toPleromaApiPagination(),
            onlyLocal: onlyLocal,
            withMuted: withMuted,
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
            replyVisibilityFilter:
                replyVisibilityFilter?.toPleromaApiReplyVisibilityFilter(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getHomeTimelineFeature =>
      pleromaApiTimelineUserAccessService.getHomeTimelineFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getHomeTimelinePaginationMinIdFeature =>
      pleromaApiTimelineUserAccessService.getHomeTimelinePaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiStatus>> getListTimeline({
    required String listId,
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) =>
      pleromaApiTimelineUserAccessService
          .getListTimeline(
            listId: listId,
            pagination: pagination?.toPleromaApiPagination(),
            onlyLocal: onlyLocal,
            withMuted: withMuted,
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getListTimelineFeature =>
      pleromaApiTimelineUserAccessService.getListTimelineFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getListTimelinePaginationMinIdFeature =>
      pleromaApiTimelineUserAccessService.getListTimelinePaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

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
  }) =>
      pleromaApiTimelineUserAccessService
          .getPublicTimeline(
            pagination: pagination?.toPleromaApiPagination(),
            onlyWithMedia: onlyWithMedia,
            onlyLocal: onlyLocal,
            onlyRemote: onlyRemote,
            withMuted: withMuted,
            onlyFromInstance: onlyFromInstance,
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
            replyVisibilityFilter:
                replyVisibilityFilter?.toPleromaApiReplyVisibilityFilter(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getPublicTimelineFeature =>
      pleromaApiTimelineUserAccessService.getPublicTimelineFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getPublicTimelineOnlyMediaFeature =>
      pleromaApiTimelineUserAccessService.getPublicTimelineOnlyMediaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getPublicTimelineOnlyRemoteFeature =>
      pleromaApiTimelineUserAccessService.getPublicTimelineOnlyRemoteFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getPublicTimelinePaginationMinIdFeature =>
      pleromaApiTimelineUserAccessService
          .getPublicTimelinePaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getHashtagTimelineExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getHashtagTimelineWithMutedFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getHomeTimelineExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getHomeTimelineReplyVisibilityFilterFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getHomeTimelineWithMutedFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getListTimelineExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getListTimelineOnlyLocalFilterFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getListTimelineWithMutedFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getPublicTimelineExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getPublicTimelineOnlyFromInstanceFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getPublicTimelineReplyVisibilityFilterFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getPublicTimelineWithMutedFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      pleromaApiTimelineUserAccessService
          .calculatePossibleExcludeVisibilitiesValues()
          .toUnifediApiVisibilityList();
}
