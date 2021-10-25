import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../status/mastodon_api_status_model.dart';
import '../public/mastodon_api_timeline_public_access_service.dart';

abstract class IMastodonApiTimelineUserAccessService
    implements IMastodonApiTimelinePublicAccessService {
  IMastodonApiFeature get getHomeTimelineFeature;
  IMastodonApiFeature get getHomeTimelinePaginationMinIdFeature;
  IMastodonApiFeature get getListTimelineFeature;
  IMastodonApiFeature get getListTimelinePaginationMinIdFeature;

  Future<List<IMastodonApiStatus>> getHomeTimeline({
    required IMastodonApiPagination? pagination,
    required bool? onlyLocal,
  });

  Future<List<IMastodonApiStatus>> getListTimeline({
    required String listId,
    required IMastodonApiPagination? pagination,
  });
}
