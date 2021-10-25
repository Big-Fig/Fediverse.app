import '../../feature/unifedi_api_feature_model.dart';
import '../../unifedi_api_service.dart';
import '../unifedi_api_announcement_model.dart';

abstract class IUnifediApiAnnouncementService implements IUnifediApiService {
  IUnifediApiFeature get getAnnouncementsFeature;

  Future<List<IUnifediApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  });

  IUnifediApiFeature get dismissAnnouncementFeature;

  Future<void> dismissAnnouncement({
    required String announcementId,
  });

  IUnifediApiFeature get addAnnouncementReactionFeature;

  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  });

  IUnifediApiFeature get removeAnnouncementReactionFeature;

  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  });
}
