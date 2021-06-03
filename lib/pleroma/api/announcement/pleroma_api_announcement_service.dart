import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAnnouncementService implements IPleromaApi {
  static IPleromaApiAnnouncementService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiAnnouncementService>(context, listen: listen);

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
