import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../../status/mastodon_api_status_model.dart';

abstract class IMastodonApiTimelinePublicAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get getPublicTimelineFeature;
  IMastodonApiFeature get getPublicTimelineOnlyMediaFeature;
  IMastodonApiFeature get getPublicTimelinePaginationMinIdFeature;
  IMastodonApiFeature get getPublicTimelineOnlyRemoteFeature;
  IMastodonApiFeature get getHashtagTimelineFeature;
  IMastodonApiFeature get getHashtagTimelineOnlyMediaFeature;
  IMastodonApiFeature get getHashtagTimelinePaginationMinIdFeature;

  Future<List<IMastodonApiStatus>> getPublicTimeline({
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
  });

  Future<List<IMastodonApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
  });
}
