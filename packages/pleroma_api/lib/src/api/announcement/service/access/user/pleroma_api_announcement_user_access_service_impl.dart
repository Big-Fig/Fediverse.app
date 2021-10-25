import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_announcement_model.dart';
import '../../../pleroma_api_announcement_model_impl.dart';
import 'pleroma_api_announcement_user_access_service.dart';

class PleromaApiAnnouncementUserAccessService extends PleromaApiService
    implements IPleromaApiAnnouncementUserAccessService {
  final MastodonApiAnnouncementUserAccessService
      mastodonApiAnnouncementUserAccessService;

  PleromaApiAnnouncementUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiAnnouncementUserAccessService =
            MastodonApiAnnouncementUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiAnnouncementUserAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAnnouncementsFeature,
        fieldFeatures: null,
        request: mastodonApiAnnouncementUserAccessService
            .createGetAnnouncementsRequest(
          withDismissed: withDismissed,
        ),
        jsonParser: (json) => PleromaApiAnnouncement.fromJson(json),
      );

  @override
  Future<void> dismissAnnouncement({
    required String announcementId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissAnnouncementFeature,
        fieldFeatures: null,
        request: mastodonApiAnnouncementUserAccessService
            .createDismissAnnouncementRequest(
          announcementId: announcementId,
        ),
      );

  @override
  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: addAnnouncementReactionFeature,
        fieldFeatures: null,
        request: mastodonApiAnnouncementUserAccessService
            .createAddAnnouncementReactionRequest(
          announcementId: announcementId,
          name: name,
        ),
      );

  @override
  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: removeAnnouncementReactionFeature,
        fieldFeatures: null,
        request: mastodonApiAnnouncementUserAccessService
            .createRemoveAnnouncementReactionRequest(
          announcementId: announcementId,
          name: name,
        ),
      );

  @override
  IPleromaApiFeature get addAnnouncementReactionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAnnouncementUserAccessService.addAnnouncementReactionFeature,
      );

  @override
  IPleromaApiFeature get dismissAnnouncementFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAnnouncementUserAccessService.dismissAnnouncementFeature,
      );

  @override
  IPleromaApiFeature get getAnnouncementsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAnnouncementUserAccessService.getAnnouncementsFeature,
      );

  @override
  IPleromaApiFeature get removeAnnouncementReactionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAnnouncementUserAccessService
            .removeAnnouncementReactionFeature,
      );
}
