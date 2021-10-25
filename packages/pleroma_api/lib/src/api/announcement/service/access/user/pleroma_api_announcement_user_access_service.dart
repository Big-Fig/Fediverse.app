import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../pleroma_api_announcement_model.dart';

abstract class IPleromaApiAnnouncementUserAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get getAnnouncementsFeature;

  Future<List<IPleromaApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  });

  IPleromaApiFeature get dismissAnnouncementFeature;

  Future<void> dismissAnnouncement({
    required String announcementId,
  });

  IPleromaApiFeature get addAnnouncementReactionFeature;

  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  });

  IPleromaApiFeature get removeAnnouncementReactionFeature;

  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  });
}
