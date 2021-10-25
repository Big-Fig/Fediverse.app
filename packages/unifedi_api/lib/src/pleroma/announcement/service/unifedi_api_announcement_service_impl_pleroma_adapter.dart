import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/announcement/service/unifedi_api_announcement_service.dart';
import '../../../api/announcement/unifedi_api_announcement_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../unifedi_api_announcement_model_pleroma_adapter.dart';

class UnifediApiAnnouncementServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiAnnouncementService {
  final IPleromaApiAnnouncementUserAccessService
      pleromaApiAnnouncementUserAccessService;

  UnifediApiAnnouncementServicePleromaAdapter({
    required this.pleromaApiAnnouncementUserAccessService,
  });

  @override
  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      pleromaApiAnnouncementUserAccessService.addAnnouncementReaction(
        announcementId: announcementId,
        name: name,
      );

  @override
  IUnifediApiFeature get addAnnouncementReactionFeature =>
      pleromaApiAnnouncementUserAccessService.addAnnouncementReactionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> dismissAnnouncement({
    required String announcementId,
  }) =>
      pleromaApiAnnouncementUserAccessService.dismissAnnouncement(
        announcementId: announcementId,
      );

  @override
  IUnifediApiFeature get dismissAnnouncementFeature =>
      pleromaApiAnnouncementUserAccessService.dismissAnnouncementFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  }) =>
      pleromaApiAnnouncementUserAccessService
          .getAnnouncements(
            withDismissed: withDismissed,
          )
          .then(
            (value) => value.toUnifediApiAnnouncementPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getAnnouncementsFeature =>
      pleromaApiAnnouncementUserAccessService.getAnnouncementsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      pleromaApiAnnouncementUserAccessService.removeAnnouncementReaction(
        announcementId: announcementId,
        name: name,
      );

  @override
  IUnifediApiFeature get removeAnnouncementReactionFeature =>
      pleromaApiAnnouncementUserAccessService.removeAnnouncementReactionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiAnnouncementUserAccessService.restService,
      );
}
