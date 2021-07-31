import 'package:pleroma_fediverse_api/src/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiAnnouncementService implements IPleromaApi {
  Future<List<IPleromaApiAnnouncement>> getAnnouncements({
    bool withDismissed = false,
  });

  Future dismissAnnouncement({
    required String announcementId,
  });

  Future addAnnouncementReaction({
    required String announcementId,
    required String name,
  });

  Future removeAnnouncementReaction({
    required String announcementId,
    required String name,
  });
}
