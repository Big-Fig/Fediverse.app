import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/announcement/service/unifedi_api_announcement_service.dart';
import '../../../api/announcement/unifedi_api_announcement_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_announcement_model_mastodon_adapter.dart';

class UnifediApiAnnouncementServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiAnnouncementService {
  final IMastodonApiAnnouncementUserAccessService
      mastodonApiAnnouncementUserAccessService;

  UnifediApiAnnouncementServiceMastodonAdapter({
    required this.mastodonApiAnnouncementUserAccessService,
  });

  @override
  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      mastodonApiAnnouncementUserAccessService.addAnnouncementReaction(
        announcementId: announcementId,
        name: name,
      );

  @override
  IUnifediApiFeature get addAnnouncementReactionFeature =>
      mastodonApiAnnouncementUserAccessService.addAnnouncementReactionFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> dismissAnnouncement({
    required String announcementId,
  }) =>
      mastodonApiAnnouncementUserAccessService.dismissAnnouncement(
        announcementId: announcementId,
      );

  @override
  IUnifediApiFeature get dismissAnnouncementFeature =>
      mastodonApiAnnouncementUserAccessService.dismissAnnouncementFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  }) =>
      mastodonApiAnnouncementUserAccessService
          .getAnnouncements(
            withDismissed: withDismissed,
          )
          .then(
            (value) => value.toUnifediApiAnnouncementMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getAnnouncementsFeature =>
      mastodonApiAnnouncementUserAccessService.getAnnouncementsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      mastodonApiAnnouncementUserAccessService.removeAnnouncementReaction(
        announcementId: announcementId,
        name: name,
      );

  @override
  IUnifediApiFeature get removeAnnouncementReactionFeature =>
      mastodonApiAnnouncementUserAccessService.removeAnnouncementReactionFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiAnnouncementUserAccessService.restService,
      );
}
