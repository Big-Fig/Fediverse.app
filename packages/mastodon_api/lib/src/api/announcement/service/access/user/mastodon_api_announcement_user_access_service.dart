import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_announcement_model.dart';

abstract class IMastodonApiAnnouncementUserAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get getAnnouncementsFeature;

  Future<List<IMastodonApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  });

  IMastodonApiFeature get dismissAnnouncementFeature;

  Future<void> dismissAnnouncement({
    required String announcementId,
  });

  IMastodonApiFeature get addAnnouncementReactionFeature;

  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  });

  IMastodonApiFeature get removeAnnouncementReactionFeature;

  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  });
}
